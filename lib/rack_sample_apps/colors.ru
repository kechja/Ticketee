run lambda { |x|
  [
    200,
    { "Content-type" => "text/plain" },
    [
      %q(red green blue orange white black).split.sample
    ]
  ]
}
