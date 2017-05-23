### Generated by rprotoc. DO NOT EDIT!
### <proto file: ../vector-tile-spec/2.1/vector_tile.proto>
# package vector_tile;
# 
# option optimize_for = LITE_RUNTIME;
# 
# message Tile {
# 
#         // GeomType is described in section 4.3.4 of the specification
#         enum GeomType {
#              UNKNOWN = 0;
#              POINT = 1;
#              LINESTRING = 2;
#              POLYGON = 3;
#         }
# 
#         // Variant type encoding
#         // The use of values is described in section 4.1 of the specification
#         message Value {
#                 // Exactly one of these values must be present in a valid message
#                 optional string string_value = 1;
#                 optional float float_value = 2;
#                 optional double double_value = 3;
#                 optional int64 int_value = 4;
#                 optional uint64 uint_value = 5;
#                 optional sint64 sint_value = 6;
#                 optional bool bool_value = 7;
# 
#                 extensions 8 to max;
#         }
# 
#         // Features are described in section 4.2 of the specification
#         message Feature {
#                 optional uint64 id = 1 [ default = 0 ];
# 
#                 // Tags of this feature are encoded as repeated pairs of
#                 // integers.
#                 // A detailed description of tags is located in sections
#                 // 4.2 and 4.4 of the specification
#                 repeated uint32 tags = 2 [ packed = true ];
# 
#                 // The type of geometry stored in this feature.
#                 optional GeomType type = 3 [ default = UNKNOWN ];
# 
#                 // Contains a stream of commands and parameters (vertices).
#                 // A detailed description on geometry encoding is located in 
#                 // section 4.3 of the specification.
#                 repeated uint32 geometry = 4 [ packed = true ];
#         }
# 
#         // Layers are described in section 4.1 of the specification
#         message Layer {
#                 // Any compliant implementation must first read the version
#                 // number encoded in this message and choose the correct
#                 // implementation for this version number before proceeding to
#                 // decode other parts of this message.
#                 required uint32 version = 15 [ default = 1 ];
# 
#                 required string name = 1;
# 
#                 // The actual features in this tile.
#                 repeated Feature features = 2;
# 
#                 // Dictionary encoding for keys
#                 repeated string keys = 3;
# 
#                 // Dictionary encoding for values
#                 repeated Value values = 4;
# 
#                 // Although this is an "optional" field it is required by the specification.
#                 // See https://github.com/mapbox/vector-tile-spec/issues/47
#                 optional uint32 extent = 5 [ default = 4096 ];
# 
#                 extensions 16 to max;
#         }
# 
#         repeated Layer layers = 3;
# 
#         extensions 16 to 8191;
# }

require 'protobuf/message/message'
require 'protobuf/message/enum'
require 'protobuf/message/service'
require 'protobuf/message/extend'

module VectorTile
  ::Protobuf::OPTIONS[:"optimize_for"] = :LITE_RUNTIME
  class Tile < ::Protobuf::Message
    defined_in __FILE__
    class GeomType < ::Protobuf::Enum
      defined_in __FILE__
      UNKNOWN = value(:UNKNOWN, 0)
      POINT = value(:POINT, 1)
      LINESTRING = value(:LINESTRING, 2)
      POLYGON = value(:POLYGON, 3)
    end
    class Value < ::Protobuf::Message
      defined_in __FILE__
      optional :string, :string_value, 1
      optional :float, :float_value, 2
      optional :double, :double_value, 3
      optional :int64, :int_value, 4
      optional :uint64, :uint_value, 5
      optional :sint64, :sint_value, 6
      optional :bool, :bool_value, 7
      extensions 8..::Protobuf::Extend::MAX
    end
    class Feature < ::Protobuf::Message
      defined_in __FILE__
      optional :uint64, :id, 1, :default => 0
      repeated :uint32, :tags, 2, :packed => true
      optional :GeomType, :type, 3, :default => :UNKNOWN
      repeated :uint32, :geometry, 4, :packed => true
    end
    class Layer < ::Protobuf::Message
      defined_in __FILE__
      required :uint32, :version, 15, :default => 1
      required :string, :name, 1
      repeated :Feature, :features, 2
      repeated :string, :keys, 3
      repeated :Value, :values, 4
      optional :uint32, :extent, 5, :default => 4096
      extensions 16..::Protobuf::Extend::MAX
    end
    repeated :Layer, :layers, 3
    extensions 16..8191
  end
end