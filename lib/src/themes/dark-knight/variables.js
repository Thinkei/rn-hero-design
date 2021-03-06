import { Platform } from 'react-native';
import normalizeText from '../../helpers/normalizeText';

const isWeb = Platform.OS === 'web';

export const BLUE = '#1dbeee';
export const FOCUS_BLUE_1 = '#003580';
export const FOCUS_BLUE_2 = '#40679f';
export const FOCUS_BLUE_3 = '#5d7ead';
export const BACKGROUND_BLUE_1 = '#347ab7';
export const BACKGROUND_BLUE_2 = '#b5eeff';
export const BACKGROUND_BLUE_3 = '#e6f7ff';
export const RED = '#de350b';

export const BLACK = '#111111';
export const GREY_1 = '#444444';
export const GREY_2 = '#777777';
export const GREY_3 = '#a3a6ac';
export const GREY_4 = '#d9dbdf';
export const GREY_5 = '#f5f6f8';
export const WHITE = '#fcfcfc';

export const BASE_SIZE = isWeb ? 16 : normalizeText(13);
export const FONT_SIZE = isWeb ? 16 : normalizeText(13);

// Edit these 👇

export const FONT_FAMILY = isWeb ? undefined : 'Proxima Nova';

export const PRIMARY_COLOR = BLUE;
export const DANGER_COLOR = RED;

export const TEXT_COLOR = GREY_5;
export const INVERTED_TEXT_COLOR = BLACK;
export const DISABLED_TEXT_COLOR = GREY_2;
export const MUTED_TEXT_COLOR = GREY_2;
export const LINK_TEXT_COLOR = BLUE;

export const BORDER_COLOR = GREY_1;
export const BACKGROUND_COLOR = BLACK;
export const DISABLED_BACKGROUND_COLOR = GREY_1;

export const SMALL_SIZE = BASE_SIZE * 0.5;
export const MEDIUM_SIZE = BASE_SIZE * 1;
export const LARGE_SIZE = BASE_SIZE * 1.5;

export const HEADER_5 = FONT_SIZE * 0.83;
export const HEADER_4 = FONT_SIZE * 1;
export const HEADER_3 = FONT_SIZE * 1.17;
export const HEADER_2 = FONT_SIZE * 1.5;
export const HEADER_1 = FONT_SIZE * 2;
