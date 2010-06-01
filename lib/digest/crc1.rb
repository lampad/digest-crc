require 'digest/crc'

module Digest
  class CRC1 < CRC

    TABLE = []
    CRC_MASK = 0x00

    #
    # Packs the CRC1 checksum.
    #
    # @return [String]
    #   The CRC1 checksum.
    #
    def self.pack(crc)
      [crc].pack('c*')
    end

    #
    # Updates the CRC1 checksum.
    #
    # @param [String] data
    #   The data to update the checksum with.
    #
    def update(data)
      accum = 0
      data.each_byte { |b| accum += b }

      @crc += (accum % 256)

      return self
    end

  end
end
