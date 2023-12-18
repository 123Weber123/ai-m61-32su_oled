#ifndef __OLED_H__
#define __OLED_H__

void OLED_I2C_Init(void);

void OLED_WriteCommand(uint8_t Command);

void OLED_WriteData(uint8_t Data);

void OLED_SetCursor(uint8_t Y, uint8_t X);

void OLED_Clear(void);

void OLED_ShowChar(uint8_t Line, uint8_t Column, char Char);

void OLED_ShowString(uint8_t Line, uint8_t Column, char *String);

uint32_t OLED_Pow(uint32_t X, uint32_t Y);

void OLED_ShowNum(uint8_t Line, uint8_t Column, uint32_t Number, uint8_t Length);

void OLED_ShowSignedNum(uint8_t Line, uint8_t Column, int32_t Number, uint8_t Length);

void OLED_ShowHexNum(uint8_t Line, uint8_t Column, uint32_t Number, uint8_t Length);

void OLED_ShowBinNum(uint8_t Line, uint8_t Column, uint32_t Number, uint8_t Length);

void OLED_Init(void);

#endif

