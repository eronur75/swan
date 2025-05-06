import rclpy
from rclpy.node import Node


class SwanNode(Node):
    def __init__(self, name="swan_node_1"):
        super().__init__("swan_node")
        self.get_logger().info("Swan node has been started.")
        self.create_timer(1.0, self.on_timer)

    def on_shutdown(self):
        self.get_logger().info("Swan node is shutting down.")

    def on_timer(self):
        self.get_logger().info("Timer event occurred.")


def main(args=None):
    rclpy.init(args=args)
    node = SwanNode("swan_node_1")
    node.get_logger().info("Hello from swan_node")
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == "__main__":
    main()
