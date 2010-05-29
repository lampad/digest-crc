require 'digest/crc'

module Digest
  class CRC5 < CRC

    WIDTH = 5

    INIT_CRC = 0x1f

    XOR_MASK = 0x1f

    CRC_MASK = (0x1f << 3)

    # Generated by `./pycrc.py --algorithm=table-driven --model=crc-5 --generate=c`
    TABLE = [
      0x00, 0x70, 0xe0, 0x90, 0x88, 0xf8, 0x68, 0x18, 0x58, 0x28, 0xb8, 0xc8, 0xd0, 0xa0, 0x30, 0x40,
      0xb0, 0xc0, 0x50, 0x20, 0x38, 0x48, 0xd8, 0xa8, 0xe8, 0x98, 0x08, 0x78, 0x60, 0x10, 0x80, 0xf0,
      0x28, 0x58, 0xc8, 0xb8, 0xa0, 0xd0, 0x40, 0x30, 0x70, 0x00, 0x90, 0xe0, 0xf8, 0x88, 0x18, 0x68,
      0x98, 0xe8, 0x78, 0x08, 0x10, 0x60, 0xf0, 0x80, 0xc0, 0xb0, 0x20, 0x50, 0x48, 0x38, 0xa8, 0xd8,
      0x50, 0x20, 0xb0, 0xc0, 0xd8, 0xa8, 0x38, 0x48, 0x08, 0x78, 0xe8, 0x98, 0x80, 0xf0, 0x60, 0x10,
      0xe0, 0x90, 0x00, 0x70, 0x68, 0x18, 0x88, 0xf8, 0xb8, 0xc8, 0x58, 0x28, 0x30, 0x40, 0xd0, 0xa0,
      0x78, 0x08, 0x98, 0xe8, 0xf0, 0x80, 0x10, 0x60, 0x20, 0x50, 0xc0, 0xb0, 0xa8, 0xd8, 0x48, 0x38,
      0xc8, 0xb8, 0x28, 0x58, 0x40, 0x30, 0xa0, 0xd0, 0x90, 0xe0, 0x70, 0x00, 0x18, 0x68, 0xf8, 0x88,
      0xa0, 0xd0, 0x40, 0x30, 0x28, 0x58, 0xc8, 0xb8, 0xf8, 0x88, 0x18, 0x68, 0x70, 0x00, 0x90, 0xe0,
      0x10, 0x60, 0xf0, 0x80, 0x98, 0xe8, 0x78, 0x08, 0x48, 0x38, 0xa8, 0xd8, 0xc0, 0xb0, 0x20, 0x50,
      0x88, 0xf8, 0x68, 0x18, 0x00, 0x70, 0xe0, 0x90, 0xd0, 0xa0, 0x30, 0x40, 0x58, 0x28, 0xb8, 0xc8,
      0x38, 0x48, 0xd8, 0xa8, 0xb0, 0xc0, 0x50, 0x20, 0x60, 0x10, 0x80, 0xf0, 0xe8, 0x98, 0x08, 0x78,
      0xf0, 0x80, 0x10, 0x60, 0x78, 0x08, 0x98, 0xe8, 0xa8, 0xd8, 0x48, 0x38, 0x20, 0x50, 0xc0, 0xb0,
      0x40, 0x30, 0xa0, 0xd0, 0xc8, 0xb8, 0x28, 0x58, 0x18, 0x68, 0xf8, 0x88, 0x90, 0xe0, 0x70, 0x00,
      0xd8, 0xa8, 0x38, 0x48, 0x50, 0x20, 0xb0, 0xc0, 0x80, 0xf0, 0x60, 0x10, 0x08, 0x78, 0xe8, 0x98,
      0x68, 0x18, 0x88, 0xf8, 0xe0, 0x90, 0x00, 0x70, 0x30, 0x40, 0xd0, 0xa0, 0xb8, 0xc8, 0x58, 0x28
    ]

    def update(data)
      data.each_byte do |b|
        @crc = ((TABLE[((@crc >> 3) ^ b) & 0xff] ^ (@crc >> 8)) & CRC_MASK)
      end

      return self
    end

  end
end
