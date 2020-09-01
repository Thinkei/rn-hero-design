import React from 'react';
import { createStore } from 'redux';
import { Provider } from 'react-redux';
import { Button, Container } from 'rn-hero-design';

const store = createStore(state => state, { __theme: undefined });

export default () => (
  <Provider store={store}>
    <Container>
      <Button text="Hello Hero Design" />
    </Container>
  </Provider>
);
