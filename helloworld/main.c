// #define BL616

#include "bflb_mtimer.h"
#include "board.h"
#include "bflb_gpio.h"
#include "bflb_i2c.h"
#define DBG_TAG "MAIN"
#include "log.h"

#include "u8g2.h"

struct bflb_device_s *gpio;
u8g2_t u8g2;
static struct bflb_device_s *i2c0;

void i2c_transfer(uint8_t addr, size_t len, uint8_t *buffer)
{
    struct bflb_i2c_msg_s msgs;

    msgs.addr = addr;
    msgs.flags = 0;
    msgs.buffer = buffer;
    msgs.length = len;

    bflb_i2c_transfer(i2c0, &msgs, 1);
}

uint8_t u8x8_gpio_and_delay_template(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{

    switch (msg)
    {
    case U8X8_MSG_GPIO_AND_DELAY_INIT: // called once during init phase of u8g2/u8x8
        break;                         // can be used to setup pins
    case U8X8_MSG_DELAY_NANO:          // delay arg_int * 1 nano second

        break;
    case U8X8_MSG_DELAY_100NANO: // delay arg_int * 100 nano seconds

        break;
    case U8X8_MSG_DELAY_10MICRO: // delay arg_int * 10 micro seconds
        bflb_mtimer_delay_us(10 * arg_int);
        break;
    case U8X8_MSG_DELAY_MILLI: // delay arg_int * 1 milli second
        bflb_mtimer_delay_ms(arg_int);
        break;
    case U8X8_MSG_DELAY_I2C: // arg_int is the I2C speed in 100KHz, e.g. 4 = 400 KHz
        break;               // arg_int=1: delay by 5us, arg_int = 4: delay by 1.25us
    case U8X8_MSG_GPIO_D0:   // D0 or SPI clock pin: Output level in arg_int
                             // case U8X8_MSG_GPIO_SPI_CLOCK:
        break;
    case U8X8_MSG_GPIO_D1: // D1 or SPI data pin: Output level in arg_int
                           // case U8X8_MSG_GPIO_SPI_DATA:
        break;
    case U8X8_MSG_GPIO_D2: // D2 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_D3: // D3 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_D4: // D4 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_D5: // D5 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_D6: // D6 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_D7: // D7 pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_E: // E/WR pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_CS: // CS (chip select) pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_DC: // DC (data/cmd, A0, register select) pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_RESET: // Reset pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_CS1: // CS1 (chip select) pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_CS2: // CS2 (chip select) pin: Output level in arg_int
        break;
    case U8X8_MSG_GPIO_I2C_CLOCK: // arg_int=0: Output low at I2C clock pin
        break;                    // arg_int=1: Input dir with pullup high for I2C clock pin
    case U8X8_MSG_GPIO_I2C_DATA:  // arg_int=0: Output low at I2C data pin
        break;                    // arg_int=1: Input dir with pullup high for I2C data pin
    case U8X8_MSG_GPIO_MENU_SELECT:
        u8x8_SetGPIOResult(u8x8, /* get menu select pin state */ 0);
        break;
    case U8X8_MSG_GPIO_MENU_NEXT:
        u8x8_SetGPIOResult(u8x8, /* get menu next pin state */ 0);
        break;
    case U8X8_MSG_GPIO_MENU_PREV:
        u8x8_SetGPIOResult(u8x8, /* get menu prev pin state */ 0);
        break;
    case U8X8_MSG_GPIO_MENU_HOME:
        u8x8_SetGPIOResult(u8x8, /* get menu home pin state */ 0);
        break;
    default:
        u8x8_SetGPIOResult(u8x8, 1); // default return value
        break;
    }
    return 1;
}

uint8_t u8x8_byte_i2c(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr)
{

    struct bflb_device_s *gpio;
    static uint8_t buffer[32]; /* u8g2/u8x8 will never send more than 32 bytes between START_TRANSFER and END_TRANSFER */
    static uint8_t buf_idx;
    uint8_t *data;

    switch (msg)
    {
    case U8X8_MSG_BYTE_SEND:
        data = (uint8_t *)arg_ptr;
        while (arg_int > 0)
        {
            buffer[buf_idx++] = *data;
            data++;
            arg_int--;
        }
        break;
    case U8X8_MSG_BYTE_INIT:
        /* add your custom code to init i2c subsystem */

        gpio = bflb_device_get_by_name("gpio");
        /* I2C0_SCL */
        bflb_gpio_init(gpio, GPIO_PIN_0, GPIO_FUNC_I2C0 | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);
        /* I2C0_SDA */
        bflb_gpio_init(gpio, GPIO_PIN_1, GPIO_FUNC_I2C0 | GPIO_ALTERNATE | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_1);

        i2c0 = bflb_device_get_by_name("i2c0");
        bflb_i2c_init(i2c0, 400000);
        break;
    case U8X8_MSG_BYTE_SET_DC:
        /* ignored for i2c */
        break;
    case U8X8_MSG_BYTE_START_TRANSFER:
        buf_idx = 0;
        break;
    case U8X8_MSG_BYTE_END_TRANSFER:
        i2c_transfer(u8x8_GetI2CAddress(u8x8) >> 1, buf_idx, buffer);

        break;
    default:
        return 0;
    }
    return 1;
}

int main(void)
{

    board_init();

    u8g2_Setup_ssd1306_i2c_128x64_noname_f(&u8g2, U8G2_R0, u8x8_byte_i2c, u8x8_gpio_and_delay_template);
    u8g2_InitDisplay(&u8g2);
    u8g2_SetPowerSave(&u8g2, 0);

    gpio = bflb_device_get_by_name("gpio");

    bflb_gpio_init(gpio, GPIO_PIN_12, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
    bflb_gpio_init(gpio, GPIO_PIN_14, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);
    bflb_gpio_init(gpio, GPIO_PIN_15, GPIO_OUTPUT | GPIO_PULLUP | GPIO_SMT_EN | GPIO_DRV_0);

    bflb_gpio_reset(gpio, GPIO_PIN_12);
    bflb_gpio_reset(gpio, GPIO_PIN_14);
    bflb_gpio_reset(gpio, GPIO_PIN_15);


    bflb_gpio_set(gpio, GPIO_PIN_12);

    u8g2_SetContrast(&u8g2,50);//亮度设置

    while (1)
    {
        u8g2_ClearBuffer(&u8g2);
        

        //u8g2_DrawBox(&u8g2, 0, 0, 128, 64);
        //LOG_F("2");
        u8g2_SetFont(&u8g2,u8g2_font_wqy12_t_chinese3);
        for(int i=1;i<=4;i++){
            u8g2_DrawUTF8(&u8g2,0, i *16-1, "安信可");
        }
        

        //u8g2_DrawGlyph(&u8g2,5, 20, 0x2603);
        //u8g2_DrawGlyph(&u8g2,31, 20, 0x23f0);


        u8g2_SendBuffer(&u8g2);
        //LOG_F("3");
    }
}
