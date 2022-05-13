defmodule Picam.Camera.Config do
  # Defaults must mirror those of the `raspi_config_opt` struct in `src/raspijpgs.c`

  @default_size_width 320
  @default_size_height 0

  @default_annotation_text ""
  @default_annotation_bg false

  @default_sharpness 0
  @default_contrast 0
  @default_brightness 50
  @default_saturation 0
  @default_iso 0
  @default_vstab false

  @default_exposure_compensation 0
  @default_exposure_mode :auto

  @default_fps 0

  @default_awb_effect :auto
  @default_image_effect :none
  @default_color_effect :none

  @default_sensor_mode 0
  @default_metering_mode :average

  @default_rotation_angle 0

  @default_flip_horizontal false
  @default_flip_vertical false

  @default_region_of_interest %{x: 0, y: 0, width: 1, height: 1}

  @default_shutter_speed 0

  @default_jpeg_quality 15
  @default_jpeg_restart_interval 0

  @default_preview_enabled false
  @default_preview_fullscreen true
  @default_preview_region %{x: 0, y: 0, width: 320, height: 240}

  @default_size %{width: @default_size_width, height: @default_size_height}
  @default_annotation %{text: @default_annotation_text, bg: @default_annotation_bg}
  @default_exposure %{mode: @default_exposure_mode, compensation: @default_exposure_compensation}
  @default_effects %{
    awb: @default_awb_effect,
    image: @default_image_effect,
    color: @default_color_effect
  }
  @default_flip %{horizontal: @default_flip_horizontal, vertical: @default_flip_vertical}
  @default_jpeg %{
    quality: @default_jpeg_quality,
    restart_interval: @default_jpeg_restart_interval
  }
  @default_preview %{
    enabled: @default_preview_enabled,
    fullscreen: @default_preview_fullscreen,
    region: @default_preview_region
  }

  defstruct size: @default_size,
            annotation: @default_annotation,
            sharpness: @default_sharpness,
            contrast: @default_contrast,
            brightness: @default_brightness,
            saturation: @default_saturation,
            iso: @default_iso,
            vstab: @default_vstab,
            exposure: @default_exposure,
            fps: @default_fps,
            effects: @default_effects,
            sensor_mode: @default_sensor_mode,
            metering_mode: @default_metering_mode,
            rotation_angle: @default_rotation_angle,
            flip: @default_flip,
            region_of_interest: @default_region_of_interest,
            shutter_speed: @default_shutter_speed,
            jpeg: @default_jpeg,
            preview: @default_preview

  @typedoc """
  Camera region.

  Describes a region of the camera's field of view,
  with x and y dimensions normalized between `0.0` and `1.0`.
  """
  @type region :: %{x: float(), y: float(), width: float(), height: float()}

  @typedoc """
  Camera width and height dimensions.

  One of the dimensions may be set to 0 to auto-calculate
  it based on the aspect ratio of the camera.

  Default: `#{inspect(@default_size)}`.
  """
  @type size ::
          %{width: pos_integer(), height: pos_integer()}
          | %{width: 0, height: pos_integer()}
          | %{width: pos_integer(), height: 0}

  @typedoc """
  Camera sharpness configuration.

  Default: `#{inspect(@default_sharpness)}`.
  """
  @type sharpness :: -100..100

  @valid_sharpnesses -100..100

  @typedoc """
  Camera contrast configuration.

  Default: `#{inspect(@default_contrast)}`.
  """
  @type contrast :: -100..100

  @valid_contrasts -100..100

  @typedoc """
  Camera brightness configuration.

  Default: `#{inspect(@default_brightness)}`.
  """
  @type brightness :: 0..100

  @valid_brightnessess 0..100

  @typedoc """
  Camera saturation configuration.

  Default: `#{inspect(@default_saturation)}`.
  """
  @type saturation :: -100..100

  @valid_saturations -100..100

  @typedoc """
  Camera ISO configuration.

  If the `iso` given is 0, it will be automatically regulated by the camera.

  Default: `#{inspect(@default_iso)}`.
  """
  @type iso :: 0..800

  @valid_isos 0..800

  @typedoc """
  Camera exposure compensation (EV) level.

  Default: `#{inspect(@default_exposure_compensation)}`.
  """
  @type exposure_compensation :: -25..25

  @valid_exposure_compensations -25..25

  @typedoc """
  Camera exposure mode.

  Default: `#{inspect(@default_exposure_mode)}`.
  """
  @type exposure_mode ::
          :auto
          | :night
          | :nightpreview
          | :backlight
          | :spotlight
          | :sports
          | :snow
          | :beach
          | :verylong
          | :fixedfps
          | :antishake
          | :fireworks

  @valid_exposure_modes [
    :auto,
    :night,
    :nightpreview,
    :backlight,
    :spotlight,
    :sports,
    :snow,
    :beach,
    :verylong,
    :fixedfps,
    :antishake,
    :fireworks
  ]

  @typedoc """
  Camera frame rate configuration.

  Limits the camera to the given number of frames per second.

  The accepted range is [0.0, 90.0], but the actual rate used is governed
  by the current `t:sensor_mode/0`.

  If the rate is 0 (or 0.0), frame rate will be automatically regulated.

  Default: `#{inspect(@default_fps)}`.
  """
  @type fps :: number()

  @typedoc """
  Camera Automatic White Balance (AWB) effect.

  Default: `#{inspect(@default_awb_effect)}`.
  """
  @type awb_effect ::
          :auto
          | :off
          | :sun
          | :cloud
          | :shade
          | :tungsten
          | :fluorescent
          | :incandescent
          | :flash
          | :horizon

  @valid_awb_effects [
    :auto,
    :off,
    :sun,
    :cloud,
    :shade,
    :tungsten,
    :fluorescent,
    :incandescent,
    :flash,
    :horizon
  ]

  @typedoc """
  Camera image effect.

  Default: `#{inspect(@default_image_effect)}`.
  """
  @type image_effect ::
          :none
          | :negative
          | :solarise
          | :sketch
          | :denoise
          | :emboss
          | :oilpaint
          | :hatch
          | :gpen
          | :pastel
          | :watercolour
          | :watercolor
          | :film
          | :blur
          | :saturation
          | :colourswap
          | :colorswap
          | :washedout
          | :posterise
          | :colourpoint
          | :colorpoint
          | :colourbalance
          | :colorbalance
          | :cartoon

  @valid_image_effects [
    :none,
    :negative,
    :solarise,
    :sketch,
    :denoise,
    :emboss,
    :oilpaint,
    :hatch,
    :gpen,
    :pastel,
    :watercolour,
    :watercolor,
    :film,
    :blur,
    :saturation,
    :colourswap,
    :colorswap,
    :washedout,
    :posterise,
    :colourpoint,
    :colorpoint,
    :colourbalance,
    :colorbalance,
    :cartoon
  ]

  @typedoc """
  Camera color effect.

  The effect is set with the tuple `{u,v}`.

  The accepted range for both values is [0, 255].

  If the effect given is `:none`, color effects will be disabled.

  Default: `#{inspect(@default_color_effect)}`.
  """
  @type color_effect :: {0..255, 0..255} | :none

  @typedoc """
  Camera sensor mode.

  Details on the accepted modes (0-7) are listed in the tables below:

  ## V1 Camera Module
  | # | Resolution | Ratio | FPS Range | Video | Image | FoV     | Binning |
  |---|------------|-------|-----------|-------|-------|---------|---------|
  | 1 | 1920x1080  | 16:9  | (1, 30]   | Y     |       | Partial | None    |
  | 2 | 2592x1944  | 4:3   | (1, 15]   | Y     | Y     | Full    | None    |
  | 3 | 2592x1944  | 4:3   | [0.16, 1] | Y     | Y     | Full    | None    |
  | 4 | 1296x972   | 4:3   | (1, 42]   | Y     |       | Full    | 2x2     |
  | 5 | 1296x730   | 16:9  | (1, 49]   | Y     |       | Full    | 2x2     |
  | 6 | 640x480    | 4:3   | (42, 60]  | Y     |       | Full    | 4x4     |
  | 7 | 640x480    | 4:3   | (60, 90]  | Y     |       | Full    | 4x4     |

  ## V2 Camera Module
  | # | Resolution | Ratio | FPS Range  | Video | Image | FoV     | Binning |
  |---|------------|-------|------------|-------|-------|---------|---------|
  | 1 | 1920x1080  | 16:9  | [0.10, 30] | Y     |       | Partial | None    |
  | 2 | 3280x2464  | 4:3   | [0.10, 15] | Y     | N     | Full    | None    |
  | 3 | 3280x2464  | 4:3   | [0.10, 15] | Y     | N     | Full    | None    |
  | 4 | 1640x1232  | 4:3   | [0.10, 40] | Y     |       | Full    | 2x2     |
  | 5 | 1640x922   | 16:9  | [0.10, 40] | Y     |       | Full    | 2x2     |
  | 6 | 1280x720   | 16:9  | (40, 90]   | Y     |       | Partial | 2x2     |
  | 7 | 640x480    | 4:3   | (40, 90]   | Y     |       | Partial | 2x2     |

  If the `mode` given is 0, the camera will select a mode automatically.

  Default: `#{inspect(@default_sensor_mode)}`.
  """
  @type sensor_mode :: 0..7

  @valid_sensor_modes 0..7

  @typedoc """
  Camera metering mode.

  Default: `#{inspect(@default_metering_mode)}`.
  """
  @type metering_mode ::
          :average
          | :spot
          | :backlit
          | :matrix

  @valid_metering_modes [:average, :spot, :backlit, :matrix]

  @typedoc """
  Camera rotation angle (in degrees).

  Default: `#{inspect(@default_rotation_angle)}`.
  """
  @type rotation_angle :: 0 | 90 | 180 | 270

  @valid_rotation_angles [0, 90, 180, 270]

  @typedoc """
  Camera region of interest.

  Default: `#{inspect(@default_region_of_interest)}.
  """
  @type region_of_interest :: region()

  @typedoc """
  Camera shutter speed (in microseconds).

  If the speed given is 0, it will be automatically regulated.

  Default: `#{inspect(@default_shutter_speed)}`.
  """
  @type shutter_speed :: non_neg_integer()

  @typedoc """
  Camera JPEG capture quality.

  Default: `#{inspect(@default_jpeg_quality)}`.
  """
  @type jpeg_quality :: 1..100

  @valid_jpeg_qualities 1..100

  @typedoc """
  Camera JPEG restart interval.

  If the interval given is `0`, restart intervals will not be used.

  Default: `#{inspect(@default_jpeg_restart_interval)}`.
  """
  @type jpeg_restart_interval :: non_neg_integer()

  @typedoc """
  Camera preview window region.

  Set the location and size of the (non-fullscreen) video preview.
  This option is ignored when fullscreen preview is enabled.

  Default: `#{inspect(@default_preview_region)}.
  """
  @type preview_region :: region()

  @typedoc """
  Camera configuration settings.
  """
  @type t :: %__MODULE__{
          size: size(),
          annotation: %{text: binary(), bg: boolean()},
          sharpness: sharpness(),
          contrast: contrast(),
          brightness: brightness(),
          saturation: saturation(),
          iso: iso(),
          vstab: boolean(),
          exposure: %{mode: exposure_mode(), compensation: exposure_compensation()},
          fps: fps(),
          effects: %{
            awb: awb_effect(),
            image: image_effect(),
            color: color_effect()
          },
          sensor_mode: sensor_mode(),
          metering_mode: metering_mode(),
          rotation_angle: rotation_angle(),
          flip: %{horizontal: boolean(), vertical: boolean()},
          region_of_interest: region_of_interest(),
          shutter_speed: shutter_speed(),
          jpeg: %{quality: jpeg_quality(), restart_interval: jpeg_restart_interval()},
          preview: %{enabled: boolean(), fullscreen: boolean(), region: preview_region()}
        }
end
