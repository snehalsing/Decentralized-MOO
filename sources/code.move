module MyModule::DecentralizedMOOCs {

    use aptos_framework::signer;
    use aptos_framework::vector;

    /// Struct representing a course.
    struct Course has store, key {
        title: vector<u8>,          // Title of the course
        instructor: address,        // Address of the instructor
    }

    /// Function to create a new course.
    public fun create_course(owner: &signer, title: vector<u8>) {
        let course = Course {
            title,
            instructor: signer::address_of(owner),
        };
        move_to(owner, course);
    }

    /// Function to issue a certification to a student for a course.
    public fun issue_certification(student: &signer, course_owner: address) acquires Course {
        let course = borrow_global<Course>(course_owner);
        // Logic to issue certification (could involve storing a record, etc.)
        // Here, we simply simulate certification issuance.
    }
}