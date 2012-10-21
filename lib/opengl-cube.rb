require 'opengl'

class OpenGLCube
  include Gl
  include Glu
  include Glut

  def initialize
  	@mouse_pos_x = 0
  	@mouse_pos_y = 0

    @cube_angle_x = 0
    @cube_angle_y = 0

    # Initliaze our GLUT code
    glutInit
    # Setup a double buffer, RGBA color, alpha components and depth buffer
    glutInitDisplayMode GLUT_RGB | GLUT_DOUBLE | GLUT_ALPHA | GLUT_DEPTH
    glutInitWindowSize 640, 480
    glutInitWindowPosition 0, 0
    @window = glutCreateWindow "OpenGL Cube"
    glutDisplayFunc :draw_gl_scene
    glutReshapeFunc :reshape
    glutIdleFunc :idle
    glutKeyboardFunc :keyboard
    glutMouseFunc :mouse
    init_gl_window 640, 480
    glutMainLoop
  end

  def init_gl_window width = 640, height = 480
    # Background color to black
    glClearColor 0.0, 0.0, 0.0, 0
    # Enables clearing of depth buffer
    glClearDepth 1.0
    # Set type of depth test
    glDepthFunc GL_LEQUAL
    # Enable depth testing
    glEnable GL_DEPTH_TEST
    # Enable smooth color shading
    glShadeModel GL_SMOOTH

    glMatrixMode GL_PROJECTION
    glLoadIdentity
    # Calculate aspect ratio of the window
    gluPerspective 45.0, width / height, 0.1, 100.0

    glMatrixMode GL_MODELVIEW

    draw_gl_scene
  end

  def reshape width, height
    height = 1 if height == 0

    # Reset current viewpoint and perspective transformation
    glViewport 0, 0, width, height

    glMatrixMode GL_PROJECTION
    glLoadIdentity

    gluPerspective 45.0, width / height, 0.1, 100.0
  end

  def draw_gl_scene
    # Clear the screen and depth buffer
    glClear GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT

    # Reset the view
    glMatrixMode GL_MODELVIEW
    glLoadIdentity
    # Move right 3 units
    glTranslatef 0.0, 0.0, -7.0

    # Draw a cube
    # Rotate the cube on the X, Y and Z axis
    glRotatef @cube_angle_y, 0.0, 1.0, 0.0
    glRotatef @cube_angle_x, 1.0, 0.0, 0.0

    # Set it to a blue color one time only
    glBegin GL_QUADS do
      # Draw the top side in green
      glColor3f 0.0, 1.0, 0.0
      glVertex3f  1.0,  1.0, -1.0
      glVertex3f -1.0,  1.0, -1.0
      glVertex3f -1.0,  1.0,  1.0
      glVertex3f  1.0,  1.0,  1.0
      # Draw the bottom side in orange
      glColor3f 1.0, 0.5, 0.0
      glVertex3f  1.0, -1.0,  1.0
      glVertex3f -1.0, -1.0,  1.0
      glVertex3f -1.0, -1.0, -1.0
      glVertex3f  1.0, -1.0, -1.0
      # Draw the front side in red
      glColor3f 1.0, 0.0, 0.0
      glVertex3f  1.0,  1.0,  1.0
      glVertex3f -1.0,  1.0,  1.0
      glVertex3f -1.0, -1.0,  1.0
      glVertex3f  1.0, -1.0,  1.0
      # Draw the back side in yellow
      glColor3f 1.0, 1.0, 0.0
      glVertex3f  1.0, -1.0, -1.0
      glVertex3f -1.0, -1.0, -1.0
      glVertex3f -1.0,  1.0, -1.0
      glVertex3f  1.0,  1.0, -1.0
      # Draw the left side in blue
      glColor3f 0.0, 0.0, 1.0
      glVertex3f -1.0,  1.0,  1.0
      glVertex3f -1.0,  1.0, -1.0
      glVertex3f -1.0, -1.0, -1.0
      glVertex3f -1.0, -1.0,  1.0
      # Draw the right side in violet
      glColor3f 1.0, 0.0, 1.0
      glVertex3f  1.0,  1.0, -1.0
      glVertex3f  1.0,  1.0,  1.0
      glVertex3f  1.0, -1.0,  1.0
      glVertex3f  1.0, -1.0, -1.0
    end

    #@pyramid_angle += 0.2
    #@cube_angle -= 0.15
    # Swap buffers for display
    glutSwapBuffers
  end

  def idle
    glutPostRedisplay
  end

  def keyboard key, x, y
    case key
    when ?\e
      glutDestroyWindow @window
      exit 0
    when ?a
      @cube_angle_y -= 15.0
    when ?d 
      @cube_angle_y += 15.0
    when ?w
      @cube_angle_x -= 15.0
    when ?s
      @cube_angle_x += 15.0
    end
    glutPostRedisplay
  end

  def mouse button, state, x, y
    case button
    when GLUT_LEFT_BUTTON
      case state
      when GLUT_DOWN
      	@cube_angle_x = @mouse_pos_x - x
      	@cube_angle_y = @mouse_pos_y - y
      	@mouse_pos_x = x
      	@mouse_pos_y = y
      when GLUT_UP then puts "Left up"
      end
    when GLUT_RIGHT_BUTTON
      case state
      when GLUT_DOWN then puts "Right down"
      when GLUT_UP then puts "Right up"
      end
    end
    glutPostRedisplay
  end 

end

OpenGLCube.new if $0 == __FILE__