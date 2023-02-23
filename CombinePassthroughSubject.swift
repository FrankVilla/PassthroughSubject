//
//  ViewController.swift
//  CombinePassthroughSubject
//
//  Created by KOVIGROUP on 23/02/2023.
//

import UIKit
import Combine

    // Create a PassthroughSubject that publishes integers
    let subject = PassthroughSubject<Int, Never>()

    // Subscribe to the PassthroughSubject and print each received value
    let cancellable = subject.sink { value in
        print("Received value: \(value)")
    }

    // Publish values to the PassthroughSubject
    subject.send(1)
    subject.send(2)
    subject.send(3)

    // Cancel the subscription
    cancellable.cancel()

    // Publish another value after cancellation (this won't be printed since the subscription was cancelled)
    subject.send(4)


}

/*
 In the above example, we create a PassthroughSubject that publishes integers. We then subscribe to the subject using the sink method, which returns an AnyCancellable that we store in the cancellable constant. We print each received value using the closure passed to the sink method. We then publish some values to the subject using the send method. Finally, we cancel the subscription using the cancel method on the AnyCancellable instance.
 */
