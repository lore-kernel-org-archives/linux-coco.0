Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D9C2DC76F
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894789; cv=none; b=Fr3uPHvrc5GebB0EI8UoxPkv0o6oDJBngi7TcAva7ynUEofCazHGRWtrfhMq29zNA/zanj9h5Xd1Q6/1ItpPqw6jJghNFNRDWwBhtbyJExsI9NnqcwwPGodpXYjCaC8bkJislJkBaHxCMZ8wkQYhvpqp9PQchB9JCdG9JuQirto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894789; c=relaxed/simple;
	bh=DAtmH8CyITM9x8yq/gVxY7/o2xoz6vlXkLV6FI0ICHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9isgXADl7OvBLqb5YeMU3edosRXnu2cuup7d/34zauETptryq1y/8y2+97ne0ZeRkQPJhsmAKavRxqZ0Hp6IWorx0TIxYpqcTTiyrFQX3UlnEVV71mszDqe7ojiFBFxEyQIyX8TR46soRdBncLcdv6tErEOdGWovlCB4kvzDcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3bz7DmE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3bz7DmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779894787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q66AXjMoD4HcY+Mc1Vy0txQA/vox/wAhbo+yij5mYhs=;
	b=g3bz7DmEVBxGsGGUwPHfD5s57X2VRR0EFYnxLbYBgTyZoiseigY++EzzVjFObN9suIMltC
	2J+O+U1a7/fCR6HdSN94UR/De+sd7gqzKCZL7qeon+m00flM2WdSUNmwDxxhgmSJl1QxaK
	xif9IPK0D95Kxi3zuxOPJwjZX/CCs9M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-wBEjPybYPriut9cqOGDeEg-1; Wed, 27 May 2026 11:13:05 -0400
X-MC-Unique: wBEjPybYPriut9cqOGDeEg-1
X-Mimecast-MFC-AGG-ID: wBEjPybYPriut9cqOGDeEg_1779894785
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd92c50e6aso201103387b3.2
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 08:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894785; x=1780499585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q66AXjMoD4HcY+Mc1Vy0txQA/vox/wAhbo+yij5mYhs=;
        b=CunkRt9klra3V+wyLf3VJ09MixBHJ1a87ivZCDm+FDqnSQEKPmihvOfhkoeeV+Cw4y
         IJJ+8CLt7Omh5U3nbN7V+t5WujHy+1XKo7ldHe9SVd9jF80NKcPh4YF8GvnTZevU8zbO
         4y0I1TJSN4pxgPU+uy56Lw1X3p3gLkq+5Q8FksyJDGCKWdEu07MbLQpJjgERg4ZZiT+E
         2nbABiInLrp4Fbr9laJCg/Hq86J1AhifDeouf3TFKAtxXRxdR2WNf1a85kpJhzcCv5sx
         1ggP9nGsBvJa5GmA9jO09oBV+GgXGUi6lJUaQYJX+ZW4i1nG8W4oN8QV46SqlW+4lmBj
         TCCw==
X-Forwarded-Encrypted: i=1; AFNElJ8nO41cyTPQfrFngZnSc24rBlLu7F/ntAF+yJ4nv3ddWCKAhb1H2J5te6tEEmIWKJyV97ykC339qEqN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3HebpltZmYKUL2LQ/E9dRWoyqR5vRb/TBKKhztCrY8J00FH5Z
	iTNX3KX+hkWecYE+Jq1OYmMseq6Z8pt7II91x5lLO1Uw7qnn71r/u0sGA5JvOCX41TmqDF27SGI
	N9NE6wnZAIHbvnBSOcm9/KQmse1uUB+v+gH68dlxXQGRfhMOk3Clf2UBTHvv6UzVU1ZoPSkOwSh
	xNOcb/Crx6HAqze92YTC/t3gLTvbOpnk56c/WOORnhKE2lZg==
X-Gm-Gg: Acq92OGuMV8OC4Gysmyl/DhFc5xdFc31z++NUSoAVf/ZCOWtGV3e1kWWpLfPSdI0Lc7
	8zpmaIuDOBQFZVBV3QVXkHOfqzbeLO5cchLKzCipkBtVaaQL3dgS0x5PIncL1OkJjcKvxQgx4Tb
	DKx5DN61mVj6Lj7ACDBo3gsHKSBveEw95U7qPlMRevlJJaA72mfBhwWUoqMioCN1wylbTvI2f8p
	0r5V0lZ2Jcf14g=
X-Received: by 2002:a05:690c:6a12:b0:7dc:1d92:17f9 with SMTP id 00721157ae682-7dc1d921c36mr2008787b3.27.1779894784843;
        Wed, 27 May 2026 08:13:04 -0700 (PDT)
X-Received: by 2002:a05:690c:6a12:b0:7dc:1d92:17f9 with SMTP id
 00721157ae682-7dc1d921c36mr2008347b3.27.1779894784241; Wed, 27 May 2026
 08:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
In-Reply-To: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 27 May 2026 17:12:52 +0200
X-Gm-Features: AVHnY4K1ZVwtEAHSBgaR0RHgntIzXI1OtPPiPq6icytbmj4HyDY2tOYiLml6to4
Message-ID: <CAGxU2F4uJLH5OTv+y4712vmNBogfSspN-nJHzDJAz9N6HWeg2g@mail.gmail.com>
Subject: Re: SVSM Development Call May 27th, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: Nicola Ramacciotti <niko.ramak@gmail.com>, Tanish Desai <tanishdesai37@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IrU-MMxY5VXLXOi4VdnJSO2HXH7U0aTrFohJ1V9R6Fw_1779894785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 May 2026 at 17:46, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi,
>
> Here is the call for agenda items for this weeks SVSM development
> call. Please send any agenda items you have in mind as a reply to this
> email or raise them in the meeting.

One topic could be the 2 GSoC projects we have this year.
If Nicola and Tanish join, it would be nice to allow them some time to
present their projects. They will work with the COCONUT community
during the summer :-)

Stefano

>
> We will use the LF Zoom instance. Details of the meeting can be found
> in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The link to the COCONUT-SVSM calendar is:
>
>         https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week
>
> The meeting will be recorded and the recording eventually published.
>
> Regards,
> Stefano

