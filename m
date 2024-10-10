Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BAD19C559
	for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580493; cv=none; b=CVadY7pdafaZ/4L+lpKdbGTnY+adWHIi6xuwSU/3XFPwReC7b86mhYHrSqOnheQPQAvoEU4KRUp1Vf/o5lKXirz8VAvTV9Cs2KQXKbLVpmnK0tOKjDLGPnyYLEQXuD1kTTQE7da2QIvR5wuAOaA3mK5YU7NKAZXEmrEnTUGbUiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580493; c=relaxed/simple;
	bh=7tsn2k0TTFeg3mKqWGdSj/NaY0LxEG/+X8eD7x65Idk=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=KFfVTn/go1RTSpYuuWGO3781AE5Nd/YGmTcpBAPSoHPxFVYEKCGbRXNj3pEltd5bEy0ef4ynu3sa/vpGZ2ZoAFmRmUpdExe6Mo4pmcCoKOCw1GIxQh7rqFRck+oYBHJjcMJXpHOBTmoA7Gz0jMmDCRqqlWyMfowB1cog5BNGIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2akOGYR6; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2akOGYR6"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so1650911276.0
        for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 10:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728580490; x=1729185290; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlMcukMj6WQQSY/YNXm7ppMZ34KPgNbsj26U3em6IDA=;
        b=2akOGYR6fXtsgGKV6M0SDSSB6HDaABiUpVtB4NtcjiROH8ZSNKUa6OQqwF0+he+xfZ
         23SIf4P/qICkmIeQUWJ6CUizAt5aiN2ltmlSUL3EBo8qGKZ/9+/Zk1pp5tVkF898bTw0
         v/hZCRHQqB6YOTbiyMf1Bdz2nV27fbNApXtdEjQFP5REibjtQ/pciCLsxJHIpkC70ns9
         tRyFyfuIkqQkxGvvvnkQEufb0mcUlo/uHdDiJ8NpC8ioJZYWpI5fQDAXhnexzJNOgwVR
         H4Gp+thfC12KHp332HHiumf/Q7wDmNKBH5QTdTvqaBxhkfnLlkNCxpYcNFpjWABgo/1q
         gCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728580490; x=1729185290;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlMcukMj6WQQSY/YNXm7ppMZ34KPgNbsj26U3em6IDA=;
        b=qg/w/m22GjXO4b/gjWXAffx0wuBZAZQ9OUsKx/MCz22JY+sxqtg5meNSOQgzejo9ZS
         AkZTM5Hcqq7wbcJ/TlGLCTIqKqsk+SsJheysiAudtmNFaq7AQciR6BkuCb0+DKiQttPD
         Qm0vOb1cBHY6x+vZpIRaj9kpIRRbtLFlW5NFAo3D3qp7Nv7eXeLczE/Er7pFDmBQ5JJT
         RrNi5f8N/6vHmOtZhL9spZHaxt0yaRfR1GdO/CAnYNw8UalQXHF72lc3/WJHcztfmRgY
         NytFAO+ZRJGFAw0fBLJdvvEQy1fkPnlzIJYhg2wz2fEXsTDaj+o0v5mHe/i9QHIAbrOK
         27zg==
X-Gm-Message-State: AOJu0YyPDO7hiQGV1l7bMHXTZFU/pdBMZCmtjRZSAzdypo6Unqji8SO3
	UQq5gq0PJDUtLseBTBmzjT+pQ7AXlZf7WueoNXNHd+jsimzGeo4zbFgYoM+rJ949OhKq+T7Znen
	JkpdvwZf1OrydpZcd5fNf/g==
X-Google-Smtp-Source: AGHT+IEjAK98Mqp1AkrOnkNARo5lvT4BYelWvKMiToA561D+B3794r/t2SAvhVt/pAlzp4XFn73iXkzQ4iR+FcD5qg==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:146:b875:ac13:a9fc])
 (user=ackerleytng job=sendgmr) by 2002:a05:6902:1812:b0:e24:9f58:dd17 with
 SMTP id 3f1490d57ef6-e28fe32f042mr64913276.1.1728580490350; Thu, 10 Oct 2024
 10:14:50 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:14:48 +0000
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com> (message from
 David Hildenbrand on Thu, 10 Oct 2024 15:39:37 +0200)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <diqzy12vswvr.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

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

This time works for me as well, thank you!

>
> We would be using Google Meet.

Thanks too! Shall we use http://meet.google.com/wxp-wtju-jzw ?

And here's a calendar event if you'd like notifications:
https://calendar.google.com/calendar/event?action=TEMPLATE&tmeid=NDJvYjBha3FlMWpxdHFzMGNpNnQzZDk5cjBfMjAyNDEwMTdUMTYwMDAwWiBhY2tlcmxleXRuZ0Bnb29nbGUuY29t&tmsrc=ackerleytng%40google.com&scp=ALL

>
>
> Thoughts?
