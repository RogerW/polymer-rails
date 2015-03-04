{"changed":true,"filter":false,"title":"component.rb","tooltip":"/lib/polymer-rails/component.rb","value":"require 'nokogumbo'\n\nmodule Polymer\n  module Rails\n    class Component\n\n      ENCODING = 'UTF-8'\n      XML_NODES = ['*[selected]', '*[checked]', '*[src]:not(script)']\n      XML_OPTIONS = { save_with: Nokogiri::XML::Node::SaveOptions::NO_EMPTY_TAGS }\n\n      def initialize(data)\n        @doc = ::Nokogiri::HTML5(\"<body>#{data}</body>\")\n      end\n\n      def stringify\n        xml_nodes.reduce(to_html) do |output, node|\n          output.gsub(node.to_html, node.to_xml(XML_OPTIONS)).encode(ENCODING)\n        end\n      end\n\n      def replace_node(node, name, content)\n        node.replace create_node(name, content)\n      end\n\n      def stylesheets\n        @doc.css(\"link[rel='stylesheet']\").reject{|tag| is_external? tag.attributes['href'].value}\n      end\n\n      def javascripts\n        @doc.css(\"script[src]\").reject{|tag| is_external? tag.attributes['src'].value}\n      end\n\n      def imports\n        @doc.css(\"link[rel='import']\")\n      end\n\n    private\n\n      def create_node(name, content)\n        node = ::Nokogiri::XML::Node.new(name, @doc)\n        node.content = content\n        node\n      end\n\n      def to_html\n        @doc.css(\"body\").children.to_html(encoding: ENCODING).lstrip\n      end\n\n      def xml_nodes\n        @doc.css(XML_NODES.join(','))\n      end\n\n      def is_external?(source)\n        !URI(source).host.nil?\n      end\n    end\n  end\nend\n","undoManager":{"mark":80,"position":86,"stack":[[{"group":"doc","deltas":[{"start":{"row":10,"column":26},"end":{"row":11,"column":0},"action":"insert","lines":["",""]},{"start":{"row":11,"column":0},"end":{"row":11,"column":8},"action":"insert","lines":["        "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":8},"end":{"row":11,"column":9},"action":"insert","lines":["w"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":9},"end":{"row":11,"column":10},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":10},"end":{"row":11,"column":11},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":11},"end":{"row":11,"column":12},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":12},"end":{"row":11,"column":13},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":15},"action":"insert","lines":["\"\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":15},"action":"remove","lines":["\"\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"remove","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":13},"end":{"row":11,"column":14},"action":"insert","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"remove","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["#"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["{"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"insert","lines":["}"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":21},"end":{"row":11,"column":23},"action":"insert","lines":["\"\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":21},"end":{"row":11,"column":23},"action":"remove","lines":["\"\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":14},"end":{"row":11,"column":15},"action":"insert","lines":["S"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":15},"end":{"row":11,"column":16},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":16},"end":{"row":11,"column":17},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":17},"end":{"row":11,"column":18},"action":"insert","lines":["r"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":18},"end":{"row":11,"column":19},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":27},"end":{"row":11,"column":28},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":28},"end":{"row":11,"column":29},"action":"insert","lines":["E"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":29},"end":{"row":11,"column":30},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":30},"end":{"row":11,"column":31},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":31},"end":{"row":11,"column":32},"action":"insert","lines":["\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":32},"end":{"row":11,"column":33},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":32},"end":{"row":11,"column":33},"action":"remove","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":19},"end":{"row":11,"column":20},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":20},"end":{"row":11,"column":21},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":21},"end":{"row":11,"column":22},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":22},"end":{"row":11,"column":23},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":31},"end":{"row":11,"column":32},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":32},"end":{"row":11,"column":33},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":33},"end":{"row":11,"column":34},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":34},"end":{"row":11,"column":35},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":35},"end":{"row":11,"column":36},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":35},"end":{"row":11,"column":36},"action":"remove","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":35},"end":{"row":11,"column":36},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":36},"end":{"row":11,"column":37},"action":"insert","lines":["-"]},{"start":{"row":11,"column":37},"end":{"row":11,"column":38},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":38},"end":{"row":11,"column":39},"action":"insert","lines":["-"]},{"start":{"row":11,"column":39},"end":{"row":11,"column":40},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":40},"end":{"row":11,"column":41},"action":"insert","lines":["-"]},{"start":{"row":11,"column":41},"end":{"row":11,"column":42},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":42},"end":{"row":11,"column":43},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":43},"end":{"row":11,"column":44},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":44},"end":{"row":11,"column":45},"action":"insert","lines":["-"]},{"start":{"row":11,"column":45},"end":{"row":11,"column":46},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":46},"end":{"row":11,"column":47},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":47},"end":{"row":11,"column":48},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":48},"end":{"row":11,"column":49},"action":"insert","lines":["-"]},{"start":{"row":11,"column":49},"end":{"row":11,"column":50},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":50},"end":{"row":11,"column":51},"action":"insert","lines":["-"]},{"start":{"row":11,"column":51},"end":{"row":11,"column":52},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":52},"end":{"row":11,"column":53},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":53},"end":{"row":11,"column":54},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":54},"end":{"row":11,"column":55},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":55},"end":{"row":11,"column":56},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":56},"end":{"row":11,"column":57},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":57},"end":{"row":11,"column":58},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":58},"end":{"row":11,"column":59},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":59},"end":{"row":11,"column":60},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":60},"end":{"row":11,"column":61},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":61},"end":{"row":11,"column":62},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":62},"end":{"row":11,"column":63},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":63},"end":{"row":11,"column":64},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":64},"end":{"row":11,"column":65},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":65},"end":{"row":11,"column":66},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":66},"end":{"row":11,"column":67},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":67},"end":{"row":11,"column":68},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":68},"end":{"row":11,"column":69},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":69},"end":{"row":11,"column":70},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":70},"end":{"row":11,"column":71},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":71},"end":{"row":11,"column":72},"action":"insert","lines":["-"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":72},"end":{"row":11,"column":73},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":73},"end":{"row":11,"column":74},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":74},"end":{"row":11,"column":75},"action":"insert","lines":["\\"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":75},"end":{"row":11,"column":76},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":23},"end":{"row":11,"column":64},"action":"insert","lines":["-------------------------------------\\n\\n"]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":8},"end":{"row":11,"column":122},"action":"remove","lines":["warn \"Start\\n\\n-------------------------------------\\n\\n #{data}\\n\\n-------------------------------------\\n\\n End\""]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":6},"end":{"row":11,"column":8},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":4},"end":{"row":11,"column":6},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":2},"end":{"row":11,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":11,"column":0},"end":{"row":11,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":10,"column":26},"end":{"row":11,"column":0},"action":"remove","lines":["",""]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":10,"column":26},"end":{"row":10,"column":26},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":30,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1425459008451}