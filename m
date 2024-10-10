Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216001C9B67
	for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570029; cv=none; b=OzCWeKzjaLvOFix1L6GVTzxe/dqjnUBzoAcJtJwXtdiTrp/CJJ+haBPYUcGfCVkQ4wWjzreRmrbJJEf5PiugzfoNxQAr125tgMkQnqTzTY8cDRkxznv0cJVBTYYU/PRG4puEj57OP6Js8llL30S5Cb1A9GzznILXmpUPbZS9py4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570029; c=relaxed/simple;
	bh=0m9SqYCySAqopdZchO2z9y9ImtwfVto6iw57ZOvn7+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjTwHIJYHujiDrn1yoPtuGUy7jMQqcjeE17AjCgDwA6cUZzZh9WWsOA4UWDo5K4GHCrMwnFHbeLALvwrk87N0FAq7Mlkqcdo2U7RVYYW231982EKhAvEAT0A4U/YC9jBFbtTJJZUVG4O/uZPjHSbp/qYZztSvORRC7HFD7kypis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aG+vWLXZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aG+vWLXZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43111d23e29so213635e9.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728570026; x=1729174826; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w8CJ/RDPjfeti6YgAdBDMpo2FJOpLITD1r8p3bqSw8=;
        b=aG+vWLXZscUMbN29gSKQ014G3E9pYZ9YsRiuLvcSXpB9QqsTuTaT6VLe7LWJceGWg2
         adXVlIDg9rIzNMqgyPXTucPCrl6JploF3K3d46sR63UfqLXcesGSPmehnHg3+EbsiTIM
         MIbNxP7vNjjFm2038GfixmIak7Cdtz7zdIQMXNYIJsGL7KICNDHEGQADFj/1wS3tXwH8
         QbB1feTDTvE6MIhWl+A39S5sEdOsF5EaMGx7AUF1t3P+NHgr83dtNGo4tcrpPVaD1lmc
         0DVEIU7So6QhgO9ygGw4HFWHS9xPht8DC71kEgjWOVL4fD1C1f/ZZinEZn1Vth4pEe2P
         k+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570026; x=1729174826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w8CJ/RDPjfeti6YgAdBDMpo2FJOpLITD1r8p3bqSw8=;
        b=UoQSGvloC91VqYkh3ZWse2ASbVCnmgy3hntpKCvpRitmTvxqbnYBrxQr9WVGLWJGoo
         iLNVWO8d38RxsHybB/g2hQHJnkAqN7To7OJP8hSEetoXIECVw5KC78Vv7F+eVwQoS/H5
         3sGi8omGse5xMWbj0kX59SypnuGY919SdWB48c6ju78KqIsKfIve9bvY9FQiIpOBvs1Q
         cqeC8NXPmWJJOD/LXV4YtEyriQ4ILDdvFlqzvnibzFnkREzTnXpqKbUusZnX1jfQKg/l
         7r5wSf0Zj4y1x/PuU0+ZVhbXoQvijte5CgKZCBv4V53JTGYkhXpDwURJQgId1zjz2Cxh
         6akw==
X-Gm-Message-State: AOJu0YylC1HPxNKIXd3v54Efwte29hpxQV4J6LydQuxMgAYyVt3jj6+P
	DJIb2r0X61zt/MXcOmklZ+Fbu4JU18arzEmBOVKZYtkaVB35SfxWAzMELhmMknicr3vkSt5hxWt
	kE63wYTHvQDQ0krzECVXDw0bxjF4Od5evOK17
X-Google-Smtp-Source: AGHT+IEq2nGzeSwcLcS92pWHCevoS80XziKTpELRl2C6cml/HyK+2ePkab9udoIZsfn5KZRDKpnyzsqMDxFX9pcb3R0=
X-Received: by 2002:a05:600c:34d2:b0:42b:8ff7:bee2 with SMTP id
 5b1f17b1804b1-43116e3608fmr3673255e9.5.1728570025862; Thu, 10 Oct 2024
 07:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 10 Oct 2024 19:50:12 +0530
Message-ID: <CAGtprH848Q=RMuOvjvPGPZYhjEmZYAF-Mos2otqKKLv8+TEcMA@mail.gmail.com>
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
To: David Hildenbrand <david@redhat.com>
Cc: linux-coco@lists.linux.dev, KVM <kvm@vger.kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 7:11=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
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

Thanks for starting this discussion! A dedicated forum for covering
guest memfd specific topics sounds great. Suggested time slot works
for me.

Regards,
Vishal

>
> We would be using Google Meet.
>
>
> Thoughts?
>
> --
> Cheers,
>
> David / dhildenb
>
>
