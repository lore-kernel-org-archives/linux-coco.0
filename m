Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF771D318A
	for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570659; cv=none; b=S9AFEwa9zDBZGNgy63cZN7BI/RZJEU/x60HBWWLzG/IovbWqIwlEyyorg11m33+YCVyhlhoKO8XDHWMSU5prsI75COqj1kLcyKmn7g0+BUjIafcgf1Bc6tisQDEtklEyHUtG5Ny6uNucIpoPcIXXymQw/C0WSZXyh5oWYfS23Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570659; c=relaxed/simple;
	bh=zrDzY2dC9iSZ41dUJpIYESK9yIOH/UXXFppYEx3jWLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex/fFftLKX/VUgDfucZ7lKz6nJrnJnt0qFiqDg+vfEIttkEkmbv23E4DxpIJkwj3I6B2oAsDJFhiAuCRybyPBwes8nBHv6Xt6E2TLlRTCJsQ/0KhfadKKBnYy0W52gSAvOM+sLlRf//EAG75WtfdFmICFgUB/9gSxeFb8qxazhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWEMqAel; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWEMqAel"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so266475e9.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728570656; x=1729175456; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tE+Wl4+E4rs/M8GYD9TIuj2GI6hWuRwK8xeePMM9tf0=;
        b=JWEMqAel2OJILspf5IUYhrs8yd/bh6SVRHZLvLaJYSrQizNpHvlQ7zbtwR6SlKFdxu
         HK7IkTT4NUwtb/r6mhRZ/Bf6efIKpyC7nsF5hPJR72z10nvHTpUgGOMS7fzHCq1Nlz3w
         dj02TLaf/rWaplmcsdM60e87vdhQQLegPtD0UhtRTO9IacG45D7FluRLJNnOP2+1hc/g
         sMCsAGqkGiJ44mYRFHiZEruSpAKVc4ySjaJ5eIkmuSHGKWmBlh+ZjBwEyx8UHl92k92z
         Z7NYjdKdCB/9NZz/KJnP2GOqA03Hyyy8+3iJnbddxY36VtLloRd4+2enqJH+r8NTxmIX
         KjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570656; x=1729175456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE+Wl4+E4rs/M8GYD9TIuj2GI6hWuRwK8xeePMM9tf0=;
        b=oqJc4trjPTpkI78SxA5sdUFuLizyrjtLu+TDQiDeMF39V8GYNYZHu7FZjZBlRsXBjE
         K/9RFnBnvI2nzEw3BjAfQPybkhgRDz3bIYFplqH5eBVIwlnONk3J8v/pfzN6ebVwou9g
         Nx+l0rmGxVEgNgQ4ph3SoFna1XfmP1gqG/QpQ4iEkrJ3/8YbwweFRU6rE3zm8YZ2YOeh
         suUaXx2MoxHmtPS2HBrd2oTwb6+ErLW4apjTAZ2JkYbKurwwXKKlFCX7T1XXC3K/Z5R+
         5+Xq/mVOP0DF4TCbXOC7sqldqlx1H5sbHYWAmcWmgo0bot3eRAyErnwvmGx1rtGJUvCV
         e2DA==
X-Gm-Message-State: AOJu0YyFPeHhhyAuZk4OaGgprh97mEv6+t4HX/1eCs61JVphcHjFF6Wk
	rsd6+8DnEtGlX+seADATH0wdqksE5ejuxD6FXZkdx4E0EQ5Y0/J0Lkem0i+ktbbPtUPlfiKqOPF
	WHuOLfn7emRpI0y1VE2vT/fXZ8UZn6BVyQ2gU
X-Google-Smtp-Source: AGHT+IFZ//sRKtEd8nP9cG7ZiBnAUvA3uv+jgKyMrB0Rf8gpUxj92jmXXT+xZGnywK8RS1924DhZ8SBfhAM/Buv+Mno=
X-Received: by 2002:a05:600c:1f06:b0:42c:abae:2ed5 with SMTP id
 5b1f17b1804b1-43116e07766mr3773495e9.3.1728570655808; Thu, 10 Oct 2024
 07:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Oct 2024 15:30:18 +0100
Message-ID: <CA+EHjTx_OumyOk1zZrUh1uwkBncsXZxMKD6Z_j4WjZrd+2LVLw@mail.gmail.com>
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
To: David Hildenbrand <david@redhat.com>
Cc: linux-coco@lists.linux.dev, KVM <kvm@vger.kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 14:41, David Hildenbrand <david@redhat.com> wrote:
>
> Ahoihoi,
>
> while talking to a bunch of folks at LPC about guest_memfd, it was
> raised that there isn't really a place for people to discuss the
> development of guest_memfd on a regular basis.
>
> There is a KVM upstream call, but guest_memfd is on its way of not being
> guest_memfd specific ("library") and there is the bi-weekly MM alignment
> call, but we're not going to hijack that meeting completely + a lot of
> guest_memfd stuff doesn't need all the MM experts ;)
>
> So my proposal would be to have a bi-weekly meeting, to discuss ongoing
> development of guest_memfd, in particular:
>
> (1) Organize development: (do we need 3 different implementation
>      of mmap() support ? ;) )
> (2) Discuss current progress and challenges
> (3) Cover future ideas and directions
> (4) Whatever else makes sense
>
> Topic-wise it's relatively clear: guest_memfd extensions were one of the
> hot topics at LPC ;)
>
> I would suggest every second Thursdays from 9:00 - 10:00am PDT (GMT-7),
> starting Thursday next week (2024-10-17).
>
> We would be using Google Meet.
>
>
> Thoughts?

That works for me, thanks!

One thing to note, we're coming up to the period where the US/Europe
move away from daylight savings, but not at the same time. Just
something to keep in mind :)

Cheers,
/fuad

> --
> Cheers,
>
> David / dhildenb
>
>
