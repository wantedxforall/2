<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NewWithdrawRequest extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * The withdraw data.
     *
     * @var mixed
     */
    protected $withdraw;

    /**
     * Create a new notification instance.
     *
     * @param  mixed  $withdraw
     * @return void
     */
    public function __construct($withdraw)
    {
        $this->withdraw = $withdraw;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        $channels = ['mail'];

        if (config('notification.store_in_db')) {
            $channels[] = 'database';
        }

        return $channels;
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $credits = data_get($this->withdraw, 'credits');

        return (new MailMessage)
            ->subject('New withdraw request')
            ->line('A new withdraw request has been submitted.')
            ->when($credits, fn($mail) => $mail->line('Credits: ' . $credits));
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return ['withdraw' => $this->withdraw];
    }
}