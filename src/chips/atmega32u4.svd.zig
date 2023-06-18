const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    ///  8-bit Microcontroller with 32K bytes of ISP Flash and USB Controller
    pub const ATmega32U4 = struct {
        pub const properties = struct {
            pub const @"cpu.mpuPresent" = "false";
            pub const @"cpu.nvicPrioBits" = "8";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.deviceNumInterrupts" = "43";
            pub const @"cpu.revision" = "r0p0";
            pub const @"cpu.endian" = "little";
            pub const @"cpu.name" = "ATmega32U4";
            pub const @"cpu.fpuPresent" = "true";
        };

        pub const peripherals = struct {
            pub const PORTB = @intToPtr(*volatile types.peripherals.PORTB, 0x23);
            pub const PORTC = @intToPtr(*volatile types.peripherals.PORTC, 0x26);
            pub const PORTD = @intToPtr(*volatile types.peripherals.PORTD, 0x29);
            pub const PORTE = @intToPtr(*volatile types.peripherals.PORTE, 0x2c);
            pub const PORTF = @intToPtr(*volatile types.peripherals.PORTF, 0x2f);
            ///  8-Bit Timer/Counter0 with PWM
            pub const TIMER0 = @intToPtr(*volatile types.peripherals.TIMER0, 0x35);
            ///  16-Bit Timer/Counter1
            pub const TIMER1 = @intToPtr(*volatile types.peripherals.TIMER1, 0x36);
            ///  16-Bit Timer/Counter3
            pub const TIMER3 = @intToPtr(*volatile types.peripherals.TIMER3, 0x38);
            ///  10-bit High Speed Timer/Counter4
            pub const TIMER4 = @intToPtr(*volatile types.peripherals.TIMER4, 0x39);
            ///  External Interrupts
            pub const EXT_INT = @intToPtr(*volatile types.peripherals.EXT_INT, 0x3c);
            ///  USB Controller
            pub const USB = @intToPtr(*volatile types.peripherals.USB, 0xd7);
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        pub const PORTB = extern struct {
            ///  Port B Input Pins Address
            PIN: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Input
                P0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Input
                P1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 2 Input
                P2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 3 Input
                P3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 4 Input
                P4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Input
                P5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Input
                P6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Input
                P7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
            ///  Port B Data Direction Register
            DDR: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Direction
                DD0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 1 Direction
                DD1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 2 Direction
                DD2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 3 Direction
                DD3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 4 Direction
                DD4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 5 Direction
                DD5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 6 Direction
                DD6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 7 Direction
                DD7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
            }),
            ///  Port B Output/Data Register
            PORT: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Output/Data
                D0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Output/Data
                D1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 2 Output/Data
                D2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 3 Output/Data
                D3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 4 Output/Data
                D4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Output/Data
                D5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Output/Data
                D6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Output/Data
                D7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
        };

        pub const PORTC = extern struct {
            ///  Port C Input Pins Address
            PIN: mmio.Mmio(packed struct(u8) {
                reserved6: u6,
                ///  Pin 6 Input
                P6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Input
                P7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
            ///  Port C Data Direction Register
            DDR: mmio.Mmio(packed struct(u8) {
                reserved6: u6,
                ///  Pin 6 Direction
                DD6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 7 Direction
                DD7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
            }),
            ///  Port C Output/Data Register
            PORT: mmio.Mmio(packed struct(u8) {
                reserved6: u6,
                ///  Pin 6 Output/Data
                D6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Output/Data
                D7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
        };

        pub const PORTD = extern struct {
            ///  Port D Input Pins Address
            PIN: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Input
                P0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Input
                P1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 2 Input
                P2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 3 Input
                P3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 4 Input
                P4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Input
                P5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Input
                P6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Input
                P7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
            ///  Port D Data Direction Register
            DDR: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Direction
                DD0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 1 Direction
                DD1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 2 Direction
                DD2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 3 Direction
                DD3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 4 Direction
                DD4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 5 Direction
                DD5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 6 Direction
                DD6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 7 Direction
                DD7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
            }),
            ///  Port D Output/Data Register
            PORT: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Output/Data
                D0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Output/Data
                D1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 2 Output/Data
                D2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 3 Output/Data
                D3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 4 Output/Data
                D4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Output/Data
                D5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Output/Data
                D6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Output/Data
                D7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
        };

        pub const PORTE = extern struct {
            ///  Port E Input Pins Address
            PIN: mmio.Mmio(packed struct(u8) {
                reserved2: u2,
                ///  Pin 2 Input
                P2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                reserved6: u3,
                ///  Pin 6 Input
                P6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                padding: u1,
            }),
            ///  Port E Data Direction Register
            DDR: mmio.Mmio(packed struct(u8) {
                reserved2: u2,
                ///  Pin 2 Direction
                DD2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                reserved6: u3,
                ///  Pin 6 Direction
                DD6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                padding: u1,
            }),
            ///  Port E Output/Data Register
            PORT: mmio.Mmio(packed struct(u8) {
                reserved2: u2,
                ///  Pin 2 Output/Data
                D2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                reserved6: u3,
                ///  Pin 6 Output/Data
                D6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                padding: u1,
            }),
        };

        pub const PORTF = extern struct {
            ///  Port F Input Pins Address
            PIN: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Input
                P0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Input
                P1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                reserved4: u2,
                ///  Pin 4 Input
                P4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Input
                P5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Input
                P6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Input
                P7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
            ///  Port F Data Direction Register
            DDR: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Direction
                DD0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 1 Direction
                DD1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                reserved4: u2,
                ///  Pin 4 Direction
                DD4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 5 Direction
                DD5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 6 Direction
                DD6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
                ///  Pin 7 Direction
                DD7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is configured as an input
                        INPUT = 0x0,
                        ///  Pin is configured as an output
                        OUTPUT = 0x1,
                    },
                },
            }),
            ///  Port F Output/Data Register
            PORT: mmio.Mmio(packed struct(u8) {
                ///  Pin 0 Output/Data
                D0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 1 Output/Data
                D1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                reserved4: u2,
                ///  Pin 4 Output/Data
                D4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 5 Output/Data
                D5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 6 Output/Data
                D6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
                ///  Pin 7 Output/Data
                D7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Pin is low
                        LOW = 0x0,
                        ///  Pin is high
                        HIGH = 0x1,
                    },
                },
            }),
        };

        ///  8-Bit Timer/Counter0 with PWM
        pub const TIMER0 = extern struct {
            ///  Timer Interrupt Flag Register
            TIFR: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Flag
                TOV: u1,
                ///  Output Compare A Match Flag
                OCF_A: u1,
                ///  Output Compare B Match Flag
                OCF_B: u1,
                padding: u5,
            }),
            reserved15: [14]u8,
            ///  Timer/Counter Control Register A
            TCCR_A: mmio.Mmio(packed struct(u8) {
                ///  Waveform Generation Mode Bits 1:0
                WGM0: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal, Top: `0xff`, Update: *Immediate*, Flag: *MAX*
                        NORMAL_TOP = 0x0,
                        ///  Phase Correct PWM, Top: `0xff`, Update: *TOP*, Flag: *BOTTOM*
                        PWM_PHASE = 0x1,
                        ///  CTC, Top: *OCRA*, Update: *Immediate*, Flag: *MAX*
                        CTC = 0x2,
                        ///  Fast PWM, Top: `0xff`, Update: *TOP*, Flag: *MAX*
                        PWM_FAST = 0x3,
                    },
                },
                reserved4: u2,
                ///  Compare Match Output B Mode
                COM_B: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC0x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC0x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC0x on Compare Match (If PWM is enabled, OC0x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC0x on Compare Match (If PWM is enabled, OC0x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Match Output A Mode
                COM_A: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC0x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC0x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC0x on Compare Match (If PWM is enabled, OC0x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC0x on Compare Match (If PWM is enabled, OC0x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
            }),
            ///  Timer/Counter Control Register B
            TCCR_B: mmio.Mmio(packed struct(u8) {
                ///  Clock Select
                CS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  No clock source (Timer/Counter stopped)
                        STOPPED = 0x0,
                        ///  clkIO/1 (No prescaling)
                        IO = 0x1,
                        ///  clkIO/8 (From prescaler)
                        IO_8 = 0x2,
                        ///  clkIO/64 (From prescaler)
                        IO_64 = 0x3,
                        ///  clkIO/256 (From prescaler)
                        IO_256 = 0x4,
                        ///  clkIO/1024 (From prescaler)
                        IO_1024 = 0x5,
                        ///  External clock source on T0 pin. Clock on falling edge.
                        EXT_FALLING = 0x6,
                        ///  External clock source on T0 pin. Clock on rising edge.
                        EXT_RISING = 0x7,
                    },
                },
                ///  Waveform Generation Mode Bit 2 (Enable Top: *OCRA* for PWM modes)
                WGM2: u1,
                reserved6: u2,
                ///  Force Output Compare B
                FOC_B: u1,
                ///  Force Output Compare A
                FOC_A: u1,
            }),
            ///  Timer/Counter Register
            TCNT: u8,
            ///  Timer Output Compare Register A
            OCR_A: u8,
            ///  Timer Output Compare Register B
            OCR_B: u8,
            reserved57: [37]u8,
            ///  Timer Interrupt Mask Register
            TIMSK: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Interrupt Enable
                TOIE: u1,
                ///  Output Compare Match A Interrupt Enable
                OCIE_A: u1,
                ///  Output Compare Match B Interrupt Enable
                OCIE_B: u1,
                padding: u5,
            }),
        };

        ///  16-Bit Timer/Counter1
        pub const TIMER1 = extern struct {
            ///  Timer Interrupt Flag Register
            TIFR: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Flag
                TOV: u1,
                ///  Output Compare A Match Flag
                OCF_A: u1,
                ///  Output Compare B Match Flag
                OCF_B: u1,
                ///  Output Compare C Match Flag
                OCF_C: u1,
                reserved5: u1,
                ///  Input Capture Flag
                ICF: u1,
                padding: u2,
            }),
            reserved57: [56]u8,
            ///  Timer Interrupt Mask Register
            TIMSK: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Interrupt Enable
                TOIE: u1,
                ///  Output Compare Match A Interrupt Enable
                OCIE_A: u1,
                ///  Output Compare Match B Interrupt Enable
                OCIE_B: u1,
                ///  Output Compare Match C Interrupt Enable
                OCIE_C: u1,
                reserved5: u1,
                ///  Input Capture Interrupt Enable
                ICIE: u1,
                padding: u2,
            }),
            reserved74: [16]u8,
            ///  Timer/Counter Control Register A
            TCCR_A: mmio.Mmio(packed struct(u8) {
                ///  Waveform Generation Mode 1:0
                WGM0: u2,
                ///  Compare Output Mode for Channel C
                COM_C: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC1x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC1x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC1x on Compare Match (If PWM is enabled, OC1x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC1x on Compare Match (If PWM is enabled, OC1x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel B
                COM_B: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC1x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC1x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC1x on Compare Match (If PWM is enabled, OC1x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC1x on Compare Match (If PWM is enabled, OC1x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel A
                COM_A: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC1x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC1x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC1x on Compare Match (If PWM is enabled, OC1x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC1x on Compare Match (If PWM is enabled, OC1x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
            }),
            ///  Timer/Counter Control Register B
            TCCR_B: mmio.Mmio(packed struct(u8) {
                ///  Clock Select
                CS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  No clock source (Timer/Counter stopped)
                        STOPPED = 0x0,
                        ///  clkIO/1 (No prescaling)
                        IO = 0x1,
                        ///  clkIO/8 (From prescaler)
                        IO_8 = 0x2,
                        ///  clkIO/64 (From prescaler)
                        IO_64 = 0x3,
                        ///  clkIO/256 (From prescaler)
                        IO_256 = 0x4,
                        ///  clkIO/1024 (From prescaler)
                        IO_1024 = 0x5,
                        ///  External clock source on T0 pin. Clock on falling edge.
                        EXT_FALLING = 0x6,
                        ///  External clock source on T0 pin. Clock on rising edge.
                        EXT_RISING = 0x7,
                    },
                },
                ///  Waveform Generation Mode 3:2
                WGM2: u2,
                reserved6: u1,
                ///  Input Capture Edge Set
                ICES: u1,
                ///  Input Capture Noise Canceler
                ICNC: u1,
            }),
            ///  Timer/Counter Control Register C
            TCCR_C: mmio.Mmio(packed struct(u8) {
                reserved5: u5,
                ///  Force Output Compare for Channel C
                FOC_C: u1,
                ///  Force Output Compare for Channel B
                FOC_B: u1,
                ///  Force Output Compare for Channel A
                FOC_A: u1,
            }),
            reserved78: [1]u8,
            ///  Timer/Counter Register Low Byte
            TCNT_L: u8,
            ///  Timer/Counter Register High Byte
            TCNT_H: u8,
            ///  Input Capture Register Low Byte
            ICR_L: u8,
            ///  Input Capture Register High Byte
            ICR_H: u8,
            ///  Output Compare Register A Low Byte
            OCR_A_L: u8,
            ///  Output Compare Register A High Byte
            OCR_A_H: u8,
            ///  Output Compare Register B Low Byte
            OCR_B_L: u8,
            ///  Output Compare Register B High Byte
            OCR_B_H: u8,
            ///  Output Compare Register C Low Byte
            OCR_C_L: u8,
            ///  Output Compare Register C High Byte
            OCR_C_H: u8,
        };

        ///  16-Bit Timer/Counter3
        pub const TIMER3 = extern struct {
            ///  Timer Interrupt Flag Register
            TIFR: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Flag
                TOV: u1,
                ///  Output Compare A Match Flag
                OCF_A: u1,
                ///  Output Compare B Match Flag
                OCF_B: u1,
                ///  Output Compare C Match Flag
                OCF_C: u1,
                reserved5: u1,
                ///  Input Capture Flag
                ICF: u1,
                padding: u2,
            }),
            reserved57: [56]u8,
            ///  Timer Interrupt Mask Register
            TIMSK: mmio.Mmio(packed struct(u8) {
                ///  Timer Overflow Interrupt Enable
                TOIE: u1,
                ///  Output Compare Match A Interrupt Enable
                OCIE_A: u1,
                ///  Output Compare Match B Interrupt Enable
                OCIE_B: u1,
                ///  Output Compare Match C Interrupt Enable
                OCIE_C: u1,
                reserved5: u1,
                ///  Input Capture Interrupt Enable
                ICIE: u1,
                padding: u2,
            }),
            reserved78: [20]u8,
            ///  Input Capture Register Low Byte
            ICR_L: u8,
            ///  Input Capture Register High Byte
            ICR_H: u8,
            reserved88: [8]u8,
            ///  Timer/Counter Control Register A
            TCCR_A: mmio.Mmio(packed struct(u8) {
                ///  Waveform Generation Mode 1:0
                WGM0: u2,
                ///  Compare Output Mode for Channel C
                COM_C: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC3x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC3x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC3x on Compare Match (If PWM is enabled, OC3x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC3x on Compare Match (If PWM is enabled, OC3x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel B
                COM_B: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC3x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC3x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC3x on Compare Match (If PWM is enabled, OC3x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC3x on Compare Match (If PWM is enabled, OC3x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel A
                COM_A: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC3x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC3x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC3x on Compare Match (If PWM is enabled, OC3x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC3x on Compare Match (If PWM is enabled, OC3x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
            }),
            ///  Timer/Counter Control Register B
            TCCR_B: mmio.Mmio(packed struct(u8) {
                ///  Clock Select
                CS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  No clock source (Timer/Counter stopped)
                        STOPPED = 0x0,
                        ///  clkIO/1 (No prescaling)
                        IO = 0x1,
                        ///  clkIO/8 (From prescaler)
                        IO_8 = 0x2,
                        ///  clkIO/64 (From prescaler)
                        IO_64 = 0x3,
                        ///  clkIO/256 (From prescaler)
                        IO_256 = 0x4,
                        ///  clkIO/1024 (From prescaler)
                        IO_1024 = 0x5,
                        ///  External clock source on T0 pin. Clock on falling edge.
                        EXT_FALLING = 0x6,
                        ///  External clock source on T0 pin. Clock on rising edge.
                        EXT_RISING = 0x7,
                    },
                },
                ///  Waveform Generation Mode 3:2
                WGM2: u2,
                reserved6: u1,
                ///  Input Capture Edge Set
                ICES: u1,
                ///  Input Capture Noise Canceler
                ICNC: u1,
            }),
            ///  Timer/Counter Control Register C
            TCCR_C: mmio.Mmio(packed struct(u8) {
                reserved5: u5,
                ///  Force Output Compare for Channel C
                FOC_C: u1,
                ///  Force Output Compare for Channel B
                FOC_B: u1,
                ///  Force Output Compare for Channel A
                FOC_A: u1,
            }),
            reserved92: [1]u8,
            ///  Timer/Counter Register Low Byte
            TCNT_L: u8,
            ///  Timer/Counter Register High Byte
            TCNT_H: u8,
            reserved96: [2]u8,
            ///  Output Compare Register A Low Byte
            OCR_A_L: u8,
            ///  Output Compare Register A High Byte
            OCR_A_H: u8,
            ///  Output Compare Register B Low Byte
            OCR_B_L: u8,
            ///  Output Compare Register B High Byte
            OCR_B_H: u8,
            ///  Output Compare Register C Low Byte
            OCR_C_L: u8,
            ///  Output Compare Register C High Byte
            OCR_C_H: u8,
        };

        ///  10-bit High Speed Timer/Counter4
        pub const TIMER4 = extern struct {
            ///  Timer Interrupt Flag Register
            TIFR: mmio.Mmio(packed struct(u8) {
                reserved2: u2,
                ///  Timer Overflow Flag
                TOV: u1,
                reserved5: u2,
                ///  Output Compare Flag B
                OCF_B: u1,
                ///  Output Compare Flag A
                OCF_A: u1,
                ///  Output Compare Flag D
                OCF_D: u1,
            }),
            reserved57: [56]u8,
            ///  Timer Interrupt Mask Register
            TIMSK: mmio.Mmio(packed struct(u8) {
                reserved2: u2,
                ///  Timer Overflow Interrupt Enable
                TOIE: u1,
                reserved5: u2,
                ///  Output Compare Match B Interrupt Enable
                OCIE_B: u1,
                ///  Output Compare Match A Interrupt Enable
                OCIE_A: u1,
                ///  Output Compare Match D Interrupt Enable
                OCIE_D: u1,
            }),
            reserved133: [75]u8,
            ///  Timer/Counter Register
            TCNT: u8,
            ///  Timer/Counter High Byte
            TCH: mmio.Mmio(packed struct(u8) {
                ///  Two MSB bits of the 10-bit accesses
                TC98: u2,
                ///  Additional MSB Bit for 11-Bit Access
                TC10: u1,
                padding: u5,
            }),
            ///  Timer/Counter Control Register A
            TCCR_A: mmio.Mmio(packed struct(u8) {
                ///  Pulse Width Modulator B
                PWM_B: u1,
                ///  Pulse Width Modulator A
                PWM_A: u1,
                ///  Force Output Compare Match B
                FOC_B: u1,
                ///  Force Output Compare Match A
                FOC_A: u1,
                ///  Compare Output Mode for Channel B
                COM_B: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC4x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC4x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC4x on Compare Match (If PWM is enabled, OC4x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC4x on Compare Match (If PWM is enabled, OC4x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel A
                COM_A: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC4x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC4x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC4x on Compare Match (If PWM is enabled, OC4x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC4x on Compare Match (If PWM is enabled, OC4x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
            }),
            ///  Timer/Counter Control Register B
            TCCR_B: mmio.Mmio(packed struct(u8) {
                ///  Clock Source
                CS: packed union {
                    raw: u4,
                    value: enum(u4) {
                        ///  No clock source (Timer/Counter stopped)
                        STOPPED = 0x0,
                        ///  clk/1 (No Prescaler)
                        CLK = 0x1,
                        ///  clk/2
                        CLK_2 = 0x2,
                        ///  clk/4
                        CLK_4 = 0x3,
                        ///  clk/8
                        CLK_8 = 0x4,
                        ///  clk/16
                        CLK_16 = 0x5,
                        ///  clk/32
                        CLK_32 = 0x6,
                        ///  clk/64
                        CLK_64 = 0x7,
                        ///  clk/128
                        CLK_128 = 0x8,
                        ///  clk/256
                        CLK_256 = 0x9,
                        ///  clk/512
                        CLK_512 = 0xa,
                        ///  clk/1024
                        CLK_1024 = 0xb,
                        ///  clk/2048
                        CLK_2048 = 0xc,
                        ///  clk/4096
                        CLK_4096 = 0xd,
                        ///  clk/8192
                        CLK_8192 = 0xe,
                        ///  clk/16384
                        CLK_16384 = 0xf,
                    },
                },
                ///  Dead Time Prescaler
                DTPS: u2,
                ///  Prescaler Reset
                PSR: u1,
                ///  PWM Inversion Mode
                PWM_X: u1,
            }),
            ///  Timer/Counter Control Register C
            TCCR_C: mmio.Mmio(packed struct(u8) {
                ///  Pulse Width Modulator D
                PWM_D: u1,
                ///  Force Output Compare Match D
                FOC_D: u1,
                ///  Compare Output Mode for Channel D
                COM_D: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC4x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC4x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC4x on Compare Match (If PWM is enabled, OC4x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC4x on Compare Match (If PWM is enabled, OC4x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel B
                COM_B: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC4x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC4x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC4x on Compare Match (If PWM is enabled, OC4x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC4x on Compare Match (If PWM is enabled, OC4x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
                ///  Compare Output Mode for Channel A
                COM_A: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  Normal port operation, OC4x disconnected
                        DISCONNECTED = 0x0,
                        ///  Toggle OC4x on Compare Match (Might depend on WGM)
                        MATCH_TOGGLE = 0x1,
                        ///  Clear OC4x on Compare Match (If PWM is enabled, OC4x is set at TOP)
                        MATCH_CLEAR = 0x2,
                        ///  Set OC4x on Compare Match (If PWM is enabled, OC4x is cleared at TOP)
                        MATCH_SET = 0x3,
                    },
                },
            }),
            ///  Timer/Counter Control Register D
            TCCR_D: mmio.Mmio(packed struct(u8) {
                ///  Waveform Generation Mode
                WGM: u2,
                ///  Fault Protection Interrupt Flag
                FPF: u1,
                ///  Fault Protection Analog Comparator Enable
                FPAC: u1,
                ///  Fault Protection Edge Select
                FPES: u1,
                ///  Fault Protection Noise Canceler
                FPNC: u1,
                ///  Fault Protection Mode Enable
                FPEN: u1,
                ///  Fault Protection Interrupt Enable
                FPIE: u1,
            }),
            ///  Timer/Counter Control Register E
            TCCR_E: mmio.Mmio(packed struct(u8) {
                ///  Output Compare Override Enable (PC6)
                OCOE0: u1,
                ///  Output Compare Override Enable (PC7)
                OCOE1: u1,
                ///  Output Compare Override Enable (PB5)
                OCOE2: u1,
                ///  Output Compare Override Enable (PB6)
                OCOE3: u1,
                ///  Output Compare Override Enable (PD6)
                OCOE4: u1,
                ///  Output Compare Override Enable (PD7)
                OCOE5: u1,
                ///  Enhanced Compare/PWM Mode
                ENHC: u1,
                ///  Register Update Lock
                TLOCK: u1,
            }),
            reserved150: [10]u8,
            ///  Output Compare Register A
            OCR_A: u8,
            ///  Output Compare Register B
            OCR_B: u8,
            ///  Output Compare Register B
            OCR_C: u8,
            ///  Output Compare Register B
            OCR_D: u8,
            reserved155: [1]u8,
            ///  Dead Time Value
            DT: mmio.Mmio(packed struct(u8) {
                ///  Dead Time Value for ~OC4x Output
                DT_L: u4,
                ///  Dead Time Value for OC4x Output
                DT_H: u4,
            }),
        };

        ///  External Interrupts
        pub const EXT_INT = extern struct {
            ///  External Interrupt Flag Register
            EIFR: mmio.Mmio(packed struct(u8) {
                ///  Interrupt 0 Flag
                INTF0: u1,
                ///  Interrupt 1 Flag
                INTF1: u1,
                ///  Interrupt 2 Flag
                INTF2: u1,
                ///  Interrupt 3 Flag
                INTF3: u1,
                reserved6: u2,
                ///  Interrupt 6 Flag
                INTF6: u1,
                padding: u1,
            }),
            ///  External Interrupt Mask Register
            EIMSK: mmio.Mmio(packed struct(u8) {
                ///  Interrupt 0 Enable
                INT0: u1,
                ///  Interrupt 1 Enable
                INT1: u1,
                ///  Interrupt 2 Enable
                INT2: u1,
                ///  Interrupt 3 Enable
                INT3: u1,
                reserved6: u2,
                ///  Interrupt 6 Enable
                INT6: u1,
                padding: u1,
            }),
            reserved45: [43]u8,
            ///  External Interrupt Control Register A
            EICRA: mmio.Mmio(packed struct(u8) {
                ///  External Interrupt 0 Sense Control Bits
                ISC0: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  The low level of INTn generates an interrupt request
                        LVL_LOW = 0x0,
                        ///  Any edge of INTn generates asynchronously an interrupt request
                        EDGE_BOTH = 0x1,
                        ///  The falling edge of INTn generates asynchronously an interrupt request
                        EDGE_FALLING = 0x2,
                        ///  The rising edge of INTn generates asynchronously an interrupt request
                        EDGE_RISING = 0x3,
                    },
                },
                ///  External Interrupt 1 Sense Control Bits
                ISC1: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  The low level of INTn generates an interrupt request
                        LVL_LOW = 0x0,
                        ///  Any edge of INTn generates asynchronously an interrupt request
                        EDGE_BOTH = 0x1,
                        ///  The falling edge of INTn generates asynchronously an interrupt request
                        EDGE_FALLING = 0x2,
                        ///  The rising edge of INTn generates asynchronously an interrupt request
                        EDGE_RISING = 0x3,
                    },
                },
                ///  External Interrupt 2 Sense Control Bits
                ISC2: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  The low level of INTn generates an interrupt request
                        LVL_LOW = 0x0,
                        ///  Any edge of INTn generates asynchronously an interrupt request
                        EDGE_BOTH = 0x1,
                        ///  The falling edge of INTn generates asynchronously an interrupt request
                        EDGE_FALLING = 0x2,
                        ///  The rising edge of INTn generates asynchronously an interrupt request
                        EDGE_RISING = 0x3,
                    },
                },
                ///  External Interrupt 3 Sense Control Bits
                ISC3: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  The low level of INTn generates an interrupt request
                        LVL_LOW = 0x0,
                        ///  Any edge of INTn generates asynchronously an interrupt request
                        EDGE_BOTH = 0x1,
                        ///  The falling edge of INTn generates asynchronously an interrupt request
                        EDGE_FALLING = 0x2,
                        ///  The rising edge of INTn generates asynchronously an interrupt request
                        EDGE_RISING = 0x3,
                    },
                },
            }),
            ///  External Interrupt Control Register B
            EICRB: mmio.Mmio(packed struct(u8) {
                reserved4: u4,
                ///  External Interrupt 6 Sense Control Bits
                ISC6: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  The low level of INTn generates an interrupt request
                        LVL_LOW = 0x0,
                        ///  Any edge of INTn generates asynchronously an interrupt request
                        EDGE_BOTH = 0x1,
                        ///  The falling edge of INTn generates asynchronously an interrupt request
                        EDGE_FALLING = 0x2,
                        ///  The rising edge of INTn generates asynchronously an interrupt request
                        EDGE_RISING = 0x3,
                    },
                },
                padding: u2,
            }),
        };

        ///  USB Controller
        pub const USB = extern struct {
            ///  USB Hardware Control
            UHWCON: mmio.Mmio(packed struct(u8) {
                ///  USB pad regulator enable
                UVREGE: u1,
                padding: u7,
            }),
            ///  USB Control
            USBCON: mmio.Mmio(packed struct(u8) {
                ///  VBUS Transition Interrupt Enable
                VBUSTE: u1,
                reserved4: u3,
                ///  VBUS Pad Enable
                OTGPADE: u1,
                ///  Freeze USB Clock
                FRZCLK: u1,
                reserved7: u1,
                ///  USB macro Enable
                USBE: u1,
            }),
            ///  USB Status
            USBSTA: mmio.Mmio(packed struct(u8) {
                ///  VBus Flag
                VBUS: u1,
                ///  ID Status (Always 1)
                ID: u1,
                padding: u6,
            }),
            ///  USB Interrupt
            USBINT: mmio.Mmio(packed struct(u8) {
                ///  IVBUS Transition Interrupt Flag
                VBUSTI: u1,
                padding: u7,
            }),
            reserved9: [5]u8,
            ///  USB Device Control
            UDCON: mmio.Mmio(packed struct(u8) {
                ///  Detach Device
                DETACH: u1,
                ///  Remote Wake-Up
                RMWKUP: u1,
                ///  Low Speed Mode Selection
                LSM: u1,
                ///  Reset CPU Bit
                RSTCPU: u1,
                padding: u4,
            }),
            ///  USB Device Interrupt
            UDINT: mmio.Mmio(packed struct(u8) {
                ///  Suspend Interrupt Flag
                SUSPI: u1,
                reserved2: u1,
                ///  Start Of Frame Interrupt Flag
                SOFI: u1,
                ///  End Of Reset Interrupt Flag
                EORSTI: u1,
                ///  Wake-up CPU Interrupt Flag
                WAKEUPI: u1,
                ///  End Of Resume Interrupt Flag
                EORSMI: u1,
                ///  Upstream Resume Interrupt Flag
                UPRSMI: u1,
                padding: u1,
            }),
            ///  USB Device Interrupt Enable
            UDIEN: mmio.Mmio(packed struct(u8) {
                ///  Suspend Interrupt Enable
                SUSPE: u1,
                reserved2: u1,
                ///  Start Of Frame Interrupt Enable
                SOFE: u1,
                ///  End Of Reset Interrupt Enable
                EORSTE: u1,
                ///  Wake-up CPU Interrupt Enable
                WAKEUPE: u1,
                ///  End Of Resume Interrupt Enable
                EORSME: u1,
                ///  Upstream Resume Interrupt Enable
                UPRSME: u1,
                padding: u1,
            }),
            ///  USB Device Address
            UDADDR: mmio.Mmio(packed struct(u8) {
                ///  USB Address
                UADD: u7,
                ///  Address Enable
                ADDEN: u1,
            }),
            ///  USB Frame Number Low
            UDFNUML: mmio.Mmio(packed struct(u8) {
                ///  Frame Number (Low Bits)
                FNUM: u8,
            }),
            ///  USB Frame Number High
            UDFNUMH: mmio.Mmio(packed struct(u8) {
                ///  Frame Number (High Bits)
                FNUM: u3,
                padding: u5,
            }),
            ///  USB Frame Number CRC Error Flag
            UDMFN: mmio.Mmio(packed struct(u8) {
                reserved4: u4,
                ///  Frame Number CRC Error Flag
                FNCERR: u1,
                padding: u3,
            }),
            reserved17: [1]u8,
            ///  USB Endpoint Interrupt
            UEINTX: mmio.Mmio(packed struct(u8) {
                ///  Transmitter Ready Interrupt Flag
                TXINI: u1,
                ///  STALLEDI Interrupt Flag
                STALLEDI: u1,
                ///  Received Out Data Interrupt Flag
                RXOUTI: u1,
                ///  Received Setup Interrupt Flag
                RXSTPI: u1,
                ///  NAK OUT Received Interrupt Flag
                NAKOUTI: u1,
                ///  Read/Write Allowed Flag
                RWAL: u1,
                ///  NAK IN Received Interrupt Flag
                NAKINI: u1,
                ///  FIFO Control Bit
                FIFOCON: u1,
            }),
            ///  USB Endpoint Number
            UENUM: mmio.Mmio(packed struct(u8) {
                ///  Endpoint Number
                EPNUM: u3,
                padding: u5,
            }),
            ///  USB Endpoint Reset
            UERST: mmio.Mmio(packed struct(u8) {
                ///  Endpoint 0 FIFO Reset
                EPRST0: u1,
                ///  Endpoint 1 FIFO Reset
                EPRST1: u1,
                ///  Endpoint 2 FIFO Reset
                EPRST2: u1,
                ///  Endpoint 3 FIFO Reset
                EPRST3: u1,
                ///  Endpoint 4 FIFO Reset
                EPRST4: u1,
                ///  Endpoint 5 FIFO Reset
                EPRST5: u1,
                ///  Endpoint 6 FIFO Reset
                EPRST6: u1,
                padding: u1,
            }),
            ///  USB Endpoint Control
            UECONX: mmio.Mmio(packed struct(u8) {
                ///  Endpoint Enable
                EPEN: u1,
                reserved3: u2,
                ///  Reset Data Toggle
                RSTDT: u1,
                ///  Stall Request Clear Handshake
                STALLRQC: u1,
                ///  Stall Request Handshake
                STALLRQ: u1,
                padding: u2,
            }),
            ///  USB Endpoint Configuration 0
            UECFG0X: mmio.Mmio(packed struct(u8) {
                ///  Endpoint Direction
                EPDIR: u1,
                reserved6: u5,
                ///  Endpoint Type
                EPTYPE: u2,
            }),
            ///  USB Endpoint Configuration 1
            UECFG1X: mmio.Mmio(packed struct(u8) {
                reserved1: u1,
                ///  Endpoint Allocation
                ALLOC: u1,
                ///  Endpoint Bank
                EPBK: u2,
                ///  Endpoint Size
                EPSIZE: u3,
                padding: u1,
            }),
            ///  USB Endpoint Status 0
            UESTA0X: mmio.Mmio(packed struct(u8) {
                ///  Busy Bank Flag
                NBUSYBK: u2,
                ///  Data Toggle Sequencing Flag
                DTSEQ: u2,
                reserved5: u1,
                ///  Underflow Error Interrupt Flag
                UNDERFI: u1,
                ///  Overflow Error Interrupt Flag
                OVERFI: u1,
                ///  Configuration Status Flag
                CFGOK: u1,
            }),
            ///  USB Endpoint Status 1
            UESTA1X: mmio.Mmio(packed struct(u8) {
                ///  Current Bank Flag
                CURRBK: u2,
                ///  Control Direction Flag
                CTRLDIR: u1,
                padding: u5,
            }),
            ///  USB Endpoint Interrupt Enable
            UEIENX: mmio.Mmio(packed struct(u8) {
                ///  Transmitter Ready Interrupt Enable Flag
                TXINE: u1,
                ///  Stalled Interrupt Enable Flag
                STALLEDE: u1,
                ///  Received Out Data Interrupt Enable Flag
                RXOUTE: u1,
                ///  Received Setup Interrupt Enable Flag
                RXSTPE: u1,
                ///  NAK OUT Interrupt Enable Flag
                NAKOUTE: u1,
                reserved6: u1,
                ///  NAK IN Interrupt Enable Flag
                NAKINE: u1,
                ///  Flow Error Interrupt Enable Flag
                FLERRE: u1,
            }),
            ///  USB Endpoint Data
            UEDATX: u8,
            ///  USB Endpoint Byte Count Low
            UEBCLX: u8,
            ///  USB Endpoint Byte Count High
            UEBCHX: mmio.Mmio(packed struct(u8) {
                ///  Byte Count High Bits
                BYCT_H: u3,
                padding: u5,
            }),
            ///  USB Endpoint Interrupts
            UEINT: mmio.Mmio(packed struct(u8) {
                ///  Endpoint 0 Interrupt Bit
                D0: u1,
                ///  Endpoint 1 Interrupt Bit
                D1: u1,
                ///  Endpoint 2 Interrupt Bit
                D2: u1,
                ///  Endpoint 3 Interrupt Bit
                D3: u1,
                ///  Endpoint 4 Interrupt Bit
                D4: u1,
                ///  Endpoint 5 Interrupt Bit
                D5: u1,
                ///  Endpoint 6 Interrupt Bit
                D6: u1,
                padding: u1,
            }),
        };
    };
};
