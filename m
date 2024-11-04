Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21A1CC177
	for <linux-coco@lists.linux.dev>; Mon,  4 Nov 2024 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730752580; cv=none; b=T2KflPIpYltH/JQsXujtY0A6fyvV0gy5mdjJ1klpYn0r362XP7/pbdnTaF7IVem3ppMeRVmCkaq5ovGYyq6WvRX44Tw1FWBeAGFm5TMi619JLO/bkSK5g1WxQlCERHdapCD0sXCbSnXVvPjG/TY1fawQY3YTSpouOZTXSfp7qHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730752580; c=relaxed/simple;
	bh=/4kipNipjsy0gHcbOzkKkJwEem+dCzCJOCvQ5nlQMks=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=HGjuicquDkF6JWRKMwM0eR3aRuKU7pA2U/9G6oaCgMiNlGpgwvipiduzjFx0u1Ym3AWZ4AWlTL39IxBMHGwDeocrnSZv/MV3G7RmZrsTAMLIKVMVMHLiDOv91k6grKkL4YXRjxO8R9ohT6NHG+gYocT8WTzloN1r0i/byWOthGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJSW8y/6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJSW8y/6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20e67b82aa3so36651885ad.0
        for <linux-coco@lists.linux.dev>; Mon, 04 Nov 2024 12:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730752578; x=1731357378; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBUqoCi8K8ESiGlnRsBfO9wVHimd//kbdOXM7NxwLpg=;
        b=pJSW8y/6sgUoR7FBeWvIfgqziYywqOPmYmBzwOdNi33A7Did/j/5PlSCpF8wqgPxfB
         TvFomAploJkKPpHGosupFcq25OGQmz0VC666o4umRDluNRLzc6pcbhNTPEuB7Eqn3POs
         x30iSTTfugD5/VWLLir1Q8mSxuwvtA8RObmLGkC6ufUdl+KK4UYPi/kOew8Ru6c56atu
         y4+fNcW+VHujjdByTYBMzjg1tXTvBeY1mHLUl4bIJrj8bTPb1iBzhBSjQ5r/oD62zaDU
         YIAOfZEm4n3MFKNN51gSTDAs0Nn1XFJ8Cjyq8Paar8EMFsc0McU8FLXSMEH/djU1iyYk
         p6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730752578; x=1731357378;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBUqoCi8K8ESiGlnRsBfO9wVHimd//kbdOXM7NxwLpg=;
        b=HbCawkTzKaK/HgsCDb2df2Ca62nPzKmbuhU4zdJqlfdubvu166xAUeU4x0ugEX2VEm
         zITbadpPJgi1rjiu4gduNN2ZwcWWTp04mDWwDC71Yzt40gapP7Shoqak8sDZY0+TqUER
         dKtwKUFX4nilRg0VRDgfB++TvHifI8RoW1AhUDFdFB98XXsBsZHD1rUQyJGoIV9RxUw5
         Uwc/K4xewaYMtH/9cLQaAfKhx5BkhP/5BorAmnXzZY6wHf/5O/SM8fNeGPx7eyUvwUhX
         8IZkn9h3/S3gkE2SzdKF4RimzHcqajYCCsCeJb/OJUkiHnAANtohTbAU1O/9AJupN8zM
         moxA==
X-Gm-Message-State: AOJu0Yy01gkrn+j7QF9MfMQ0CbwVpjIEvicuiqy0odGr65j9hmfUZhMh
	l4PL41geq8U4glW4BPBhR22bQzD5pcv5WY5KWtSp9fb+OfqgiWCBCpc1D8hs1oQ5oNGwz5QOSAA
	IRM0Vgu6uCJOduKkFk81ofQ==
X-Google-Smtp-Source: AGHT+IFU04o9XUDE//mBesDzlZUGfXhW0O1bweXhu5hafrvVsG3Q2k1UIzGyEqRQkYf6VWaas7XC9AtGk9HO8gA8fA==
X-Received: from ackerleytng-ctop-specialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1612]) (user=ackerleytng job=sendgmr) by
 2002:a17:902:c401:b0:20c:e4b5:40ff with SMTP id d9443c01a7336-210f763bf78mr2611005ad.7.1730752578323;
 Mon, 04 Nov 2024 12:36:18 -0800 (PST)
Date: Mon, 04 Nov 2024 20:36:16 +0000
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com> (message from
 David Hildenbrand on Thu, 10 Oct 2024 15:39:37 +0200)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <diqzmsieybwf.fsf@ackerleytng-ctop-specialist.c.googlers.com>
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
>
> We would be using Google Meet.
>
>
> Thoughts?

We've been taking recordings of these meetings with attendees'
permission and the recordings are kind of stuck in a Google drive
now.

People interested in watching the recordings need to request access to
the meetings.

I would like to make these recordings more public and lower
administrative overheads of requesting/giving access by hosting the
videos somewhere.

Does anyone have any suggestions/preferences on a video hosting service?

Otherwise I'll default to using YouTube since that's also where LPC and
LSF/MM videos are hosted.
