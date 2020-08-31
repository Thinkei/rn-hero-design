import React from 'react';
import { ButtonGroup, Container, Text, injectTheme } from 'rn-hero-design';

const ButtonGroupScreen = ({ theme }) => {
  const [gender, setGender] = React.useState('male');
  const [interests, setInterests] = React.useState({
    technology: true,
    reading: true,
  });

  return (
    <Container>
      <Text size="h4" style={{ marginBottom: theme.variables.MEDIUM_SIZE }}>
        Gender
      </Text>

      <ButtonGroup>
        <ButtonGroup.Button
          text="Male"
          active={gender === 'male'}
          onPress={() => setGender('male')}
        />
        <ButtonGroup.Button
          text="Female"
          active={gender === 'female'}
          onPress={() => setGender('female')}
        />
        <ButtonGroup.Button
          text="Other"
          active={gender === 'other'}
          onPress={() => setGender('other')}
        />
      </ButtonGroup>

      <Text size="h4" style={{ marginVertical: theme.variables.MEDIUM_SIZE }}>
        Interests
      </Text>

      <ButtonGroup>
        <ButtonGroup.Button
          text="Science"
          active={interests.science}
          onPress={() =>
            setInterests({ ...interests, science: !interests.science })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Sport"
          active={interests.sport}
          onPress={() =>
            setInterests({ ...interests, sport: !interests.sport })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Reading"
          active={interests.reading}
          onPress={() =>
            setInterests({ ...interests, reading: !interests.reading })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Music"
          active={interests.music}
          onPress={() =>
            setInterests({ ...interests, music: !interests.music })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Novel"
          active={interests.novel}
          onPress={() =>
            setInterests({ ...interests, novel: !interests.novel })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Technology"
          active={interests.technology}
          onPress={() =>
            setInterests({ ...interests, technology: !interests.technology })
          }
          width="50%"
        />
        <ButtonGroup.Button
          text="Other"
          active={interests.other}
          onPress={() =>
            setInterests({ ...interests, other: !interests.other })
          }
          width="50%"
          wrapperStyle={{ flexGrow: 0 }}
        />
      </ButtonGroup>
    </Container>
  );
};

export default injectTheme(ButtonGroupScreen);
