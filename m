Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB1152502
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712164004; cv=none; b=TK8VBlKLMeGgBTud89VbR+KAtNC4sguG5cJ7Z7MXodLA/OQqF/w7Qlz9ZgdhUH4CDluOOphjezg6sFh2ztIZsUvlerivwZ0Rbg00MwMLZ/RXErbftKL9t/3lfsEx2Q4fjYamExcYBtSZjUCRP+QR7psDzxQ76gLjKdSlzZ9YxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712164004; c=relaxed/simple;
	bh=yfAR8MZv9+Wgs1bzHP8Fp7Cu91xpzl4IImiga3AFy64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXG7su6kY/hEp0TVxsKX/M84UxRnaImLqbkCi1YbEOwJRORlPkLSjkFZ6ibdxBzUCYC4jPh5rVQVzE0Opl3G5BOxIhCuBc1XUm08U0tXcKhLtlbnEANohPT2fpjz2NhIaV50Rs1GF9rRxjLAZKacBqk7fgxk6lrv/QLgBYKstnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fl8Thh/F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fl8Thh/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712164002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFFsKLNM6DVyAQEhs+dQiDTDz3OB5mNLzLN/zmEJcPw=;
	b=fl8Thh/FAkpFSwxRY7CiOGvljbXVvkcimOPmXUX/arMsdgrPy3Y/ryhBLuci6y9R3nLM9k
	KuB/zQ0rF51wdoOGIIeTOWzMGiPx9d/ONg3qTUlcJMsRMXCAMtqY+PIZd1RiacGUsm6Tz1
	mW5qRRG0rqJpmrxYNB73hYCHJffGJRM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Mo3c2xZUMDi8tL8CceS-xg-1; Wed, 03 Apr 2024 13:06:41 -0400
X-MC-Unique: Mo3c2xZUMDi8tL8CceS-xg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-60cd041665bso1329517b3.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Apr 2024 10:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712164000; x=1712768800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFFsKLNM6DVyAQEhs+dQiDTDz3OB5mNLzLN/zmEJcPw=;
        b=tD9ZIarSnYolWdstAFPwMxiDjZTlPjN2aztnzMjwHjzvzxAZT7TlE0QyEK5NTVdttQ
         iyRi161ts+a7SZC5s1h8Xhm6vdLW+E5yyTjp/5zZK8GW4NStDFnxALpULtCnLObFLdI3
         bzBG8oXGozeSvIEqoJeZ5ZGWX2acS0ul84R6wp075w4zIqV35YpeQAPZPYxLA9gmAB6n
         sG8YbnSoEP/OzrfDO3dGnmyY2w1azLTpVKTiu+DngSoZkxmXelimT89CgSOb0Gvmsp5z
         u43Kd/HyBmGq824LvHYx8dAeEFHgF/jtbwbS2P+y/cfGk72Q+vkYMYOIrJmkdJ7lyYkb
         Yo8g==
X-Gm-Message-State: AOJu0YxX6GnX0eOYBw8fOM0PkvAKalrJIoY3PnI2IB/49PBdWDuFyuCU
	AQ9K0Cr69NUdTIU7XgBJf3ZWiJYOM+4skooWl9z4sz05+20IRvEc4sRD0pwHSA4WnZSuB0nk/BI
	Ps96IqDxv1RxI1bOlEjZuqR6gjMWh0w1fODcSvi0uNBGKLEh6kiqXZW/9/orLt/GSOMsww9zExN
	0MRqaUkHmL7cjbbVAFbGgQHDDhk5NfeezuTBi7/3MT1JEb
X-Received: by 2002:a81:7354:0:b0:614:f59b:307 with SMTP id o81-20020a817354000000b00614f59b0307mr30668ywc.4.1712163998571;
        Wed, 03 Apr 2024 10:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZWyDJT5WUkfO3MKe4k00q9xSouGXOi7S5f66XmvfbaWYfB9biop+AqzSHdB0RkY0Uf6mK3TMGnsWsGkrLOuo=
X-Received: by 2002:a81:7354:0:b0:614:f59b:307 with SMTP id
 o81-20020a817354000000b00614f59b0307mr30640ywc.4.1712163998186; Wed, 03 Apr
 2024 10:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
In-Reply-To: <Zg07c6Y5a_Ak5oXs@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 3 Apr 2024 19:06:26 +0200
Message-ID: <CAGxU2F5qTMU1hx-qAdc0ZL6mWoxWU1JhCTZK243KnMA29AiHFA@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call April 3rd, 2024
To: svsm-devel@coconut-svsm.dev
Cc: linux-coco@lists.linux.dev, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 1:20=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
>
>         * vTPM merge fallout
>         * Security issue mitigations

As I mentioned during the call, I started a shared document to discuss
early attestation architecture in SVSM:
https://docs.google.com/document/d/11ZsxP8jsviP3ddp9Hrn0rf6inttNw_Pbnz0psXl=
xlPs

To get write access, please send me a request.
The document is really at an early stage. As J=C3=B6rg suggested, we're
keeping it on gdoc for now to collaborate, but as soon as we have an
agreement, we'll move to github in some markdown files.

As I mentioned, from next week (April 9th to be precise) I will be
away until the end of the month. I will be back online on May 3rd.
Sorry in advance for the delay in my responses.

Thanks,
Stefano

>
> The items we can not cover during the meeting will be deferred to the
> next meeting.
>
> Please note that Europe is now also on summer time, so the meeting will
> be at its usual time spot again. The definitive time is always in the
> Google calendar I shared below.
>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
>

