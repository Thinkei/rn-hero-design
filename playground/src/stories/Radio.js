import React from 'react';
import { Container, Radio } from 'rn-hero-design';

const SwitchScreen = () => {
  return (
    <Container>
      <Radio label="Option A" checked />
      <Radio label="Option B" checked={false} />
    </Container>
  );
};

export default SwitchScreen;
