class TimeDiff(torch.nn.Module):
    def __init__(self, model):
        super(TimeDiff, self).__init__()

        self.model = model

    def forward(self, x):
        copy = x.clone()
        copy = copy.view(-1, 4)
        copy[:, [0, 1]] = torch.remainder(copy[:, [0, 1]]+torch.pi, 2*torch.pi)-torch.pi # safety modulo 2 pi
        return self.model(copy)
    
    def integrate_model(self, time_span, y0, fun=None, timescale=40, **kwargs):
        t_eval = np.linspace(time_span[0], time_span[1], int(
            timescale * (time_span[1] - time_span[0])))
        data = []
        y0 = torch.FloatTensor(y0) 
        for _ in t_eval:
            y0 = self.forward(y0)
            data.append(y0)
            
        transformed_data = np.array([np.array(tensor.tolist())[0] for tensor in data]).T
        return transformed_data
    
    def transform_dataset(self, train_x, train_y):
        """
        This function shifts the training data by one to create time difference to train on.
        :param train_x: training data [theta1, theta2, p1, p2]
        :param train_y: training data [theta1/dt, theta2/dt, p1/dt, p2/dt] - this is ignored
        """
        num_rows, _ = train_x.size()
        train_x = train_x[1:]
        train_y = train_y[:num_rows-1]
        return train_x, train_y


    def train(self, train_x, train_y, lr=1e-3, epochs=100, verbose=False, print_step=50):
        train_x, train_y = self.transform_dataset(train_x, train_y)

        optim = torch.optim.Adam(
            self.parameters(), lr=lr, weight_decay=1e-4)

        stats = {"loss": []}

        for epoch in range(epochs):
            y_hat = self.forward(train_x) # just lose against the shift target, no extra transformation

            loss = (train_y-y_hat).pow(2).mean()
            loss.backward()
            optim.step()
            optim.zero_grad()

            stats["loss"].append(loss.item())

            if verbose and epoch % print_step == 0:
                print(f"Epoch {epoch}, Loss {loss.item()}")

        return stats