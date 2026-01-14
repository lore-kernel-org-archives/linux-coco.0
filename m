Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F80A285CAD
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411427; cv=none; b=Tm9CJlWQXoQbL4OHOWSBdyWrz8mk9JR55HZ35dGMck2H4BmXhKnvGbNxMqmg+8avZ01Xwqt/8ryjk9cmFfaizwLeczoZnMoKVHdX29142jDyKLNsfwOKTHisLn+4cKfhIhxhqUI4d5y4x596N0P8qaGgo6pO2yhUBnAWzN+Rqbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411427; c=relaxed/simple;
	bh=60/pCMec5sbW4vCXTi6czqr8fDOa6GUGG4jkRyNpklk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dapBeRiz9OiNnbY3lW4Orzf3rubWbBtVjIox0PkcE8Pfwrw5AYQPtxJ7EWZKRbGe1pqUCi8H7FFxULvosbYmK4Zi7iE9W60Ktr9XaBHIi0TQb+zLmuvWYwtty2HS8mBUTwmwTyf4cZsnbH0vs6WsK0wSopejScMYvns3uD/Syo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2VxoQf+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2VxoQf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768411425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMtXDHWeunBz5/gEAqWBNjnjMLZuqV4POcsc21pJOGw=;
	b=D2VxoQf+PITypWWJi9YtcR0AtEmAG5+uG26C79Hh8vmEljFb3WAtOXUUnoIXTsha5kgw9h
	NVHyan0gpT2stloemf/3z9JJnUKD+vfCjPd9WMGOFYbOd7NIdgyLg2kvqMS/RUfsJpwccL
	BRlVVhMnuCfJtmV6SbbSbytpeYUf+PI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-eaP8-bvHMj6nn1VQjXpYXg-1; Wed, 14 Jan 2026 12:23:44 -0500
X-MC-Unique: eaP8-bvHMj6nn1VQjXpYXg-1
X-Mimecast-MFC-AGG-ID: eaP8-bvHMj6nn1VQjXpYXg_1768411423
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34eb6589ed2so9137095a91.2
        for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 09:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411423; x=1769016223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMtXDHWeunBz5/gEAqWBNjnjMLZuqV4POcsc21pJOGw=;
        b=Y5WxwAxfMUqeSFnk5mEwskdyAcJ/iyFYsEzcXi0ZCE4Nd2l74nfkz169GXXBMRDX+i
         XZX1CLgC34O2F7FLrfTGnQ1ubEHgT4DQlgLLPpo0t441drvkTt9ftr8GLv7Pbd0RU937
         SAbkKK7a0T9Ehx3ecWIUYOcnKOfqENiHn2M/mABBowGU0Al5g/tXd/LITYh+UIbFyPtq
         X1q6DtHxs7otQcgo2W2IrddG/6rZMcFfYkAuz6xcOsZUMYOfZf0KEMdgxcNMKrRyUZbm
         5+LqI5tJOCYdCVOINKEAieFCLVkBKKQAU5ULm77ia83/Bi+oC6u9txZ6gLWy/P1wjHPm
         /isw==
X-Forwarded-Encrypted: i=1; AJvYcCU72n5oItTzqjmO4ntamGNrnAFAefkUqXXARPnX7aHcNRIJ8ubb7mKD56nkNJe88uojy6jUxeeoOIoX@lists.linux.dev
X-Gm-Message-State: AOJu0YywHIrMxoOyBrxB5wIQpRZaQ/Z86Q8cygJc6nQ9TqUTK2RI5IsU
	UHexhi5jC1rqvYlYRel3O7oO/NHdGuWGxlYPMk/VW/vIV7UtN4wtiFrgpCGqiSMTEqw0fJvE45a
	Ep6dsHcuRj+16fBlDGQV2bG3zJqo4Wb4A56WknKINXr4POyz6/UHHx574WVr8yllBm6Ad9MZr6d
	5J0wKU+LhjefxRKyPj7SYl/NFBfd7EmHbvIoVdlw==
X-Gm-Gg: AY/fxX7SEDvgA7iV4IrvlRE9p+nrQhvMvRsx8W1DvyUWYRsWYrTmSzjqZQPc6B7MKFI
	+juo0/7tq0wrfrQyot8wSvZIUE4Yp2WqWSuUqcxEOYngLTw1/zRS/rBFbkOm62ufEs7Bl+otOkx
	RxDOkKTfeCI5Ek1RiaFR28KbbWKKuEttMm3qt+jo91CWP3tFZvAF3AINl+XssnVV4i
X-Received: by 2002:a17:90b:54cd:b0:340:f05a:3ec2 with SMTP id 98e67ed59e1d1-3510915b86bmr3251589a91.17.1768411423332;
        Wed, 14 Jan 2026 09:23:43 -0800 (PST)
X-Received: by 2002:a17:90b:54cd:b0:340:f05a:3ec2 with SMTP id
 98e67ed59e1d1-3510915b86bmr3251564a91.17.1768411422892; Wed, 14 Jan 2026
 09:23:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
In-Reply-To: <tlhepq4dp47rbq3vpzm4qtf65t62fqe26tk736sd3ulcbwcefy@btzt3fsapu5e>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 14 Jan 2026 18:23:31 +0100
X-Gm-Features: AZwV_Qh_viSj5DvQpQuH2QF-Ny9GEAUvVoMMAgbCU7LqdsD76dwJ16psjJIM_TU
Message-ID: <CAGxU2F7Q1Kxr5OPKpKO84cVvsm=2YU1tABJM3YxMPwX0Rfh_uQ@mail.gmail.com>
Subject: Re: SVSM Development Call January 14, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s5YI3rfARKH5oTYlEULqka0XKppZBQmyBKI8ODmD4qQ_1768411423
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jan 2026 at 19:36, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> Hi,
>
> Here is the call for agenda items for this weeks SVSM development call.  =
Please
> send any agenda items you have in mind as a reply to this email or raise =
them
> in the meeting.
>
> Stefano will run the meeting tomorrow (Thanks again!) as I can not attend=
 due
> to travel.
>
> We will use the LF Zoom instance. Details of the meeting  can be found in=
 our
> governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The link to the COCONUT-SVSM calendar is:
>
>         https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-sv=
sm?view=3Dweek
>
> The meeting will be recorded and the recording eventually published.

As I mentioned in the call, QEMU community is open to host some
COCONUT SVSM projects for GSoC 2026.
You can find more details at
https://lore.kernel.org/qemu-devel/CAJSP0QVXXX7GV5W4nj7kP35x_4gbF2nG1G1jdh9=
Q=3DXgSx=3DnX3A@mail.gmail.com/
Also, you can find proposals from the past years here:
https://wiki.qemu.org/Category:GSoC

Our goal is to come up with a couple of projects related to COCONUT
SVSM by next week, since the deadline to post them to QEMU is Jan 30.

If you have any idea in mind, please share with us :-)

Thanks,
Stefano

