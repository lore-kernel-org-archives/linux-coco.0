Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF45381E
	for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 17:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728668943; cv=none; b=fwijt2MtdxqhrkYY0/EGeLneMyBtLjIpVbgTYrVV8OdbRnoQ7zV3J4SE4UYSwtgJ21PHTRrfsAvrlRbcDx6HNYYhWqoQSMZ58zNTFHLlnvUUuoaBRNN341SUxjpXaqx3KZ5+N1i/7lL8QyvKsIqEjsjcu4tIXKHQYy4us6LwS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728668943; c=relaxed/simple;
	bh=KtVZFQ5ya2uPwpGF/Pja1NI8kHzJPyvIvSlOD5IVEwE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QwfdpqTvWNhPMnfq4/Y/P0undp/qHLn+pLmjv9vWtGgpvGdQifa1ODoMuDaEIPQKkKv5Yu4SZyoPazWFG7WZ2kDCa6dld+rTLugNkZp7dofYLbg9gCnlQiQkalMPbkymdmrMhvL7wVR0qvHYJ/6A3WJNEu6BHmULcc0Rer4VUyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kwB5rKvi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kwB5rKvi"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e30fe2a9feso29260597b3.3
        for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728668941; x=1729273741; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4Puqlsgo3JtkM+YPUI+9BBuYWEnXPV4jctacnOAOZE=;
        b=kwB5rKvirdm3PNd1RJPzE5yHB9aOd6RP54jksbBg5926/yBnX689MgZ17aGwKMEtiP
         BSeoPQ/Zyj2oMbFp1LpFFv+V3CsLGHAWH2Q6suqgUcw1QCCbGrwrvbOI8iIlS3NW25nc
         O1f/46fJkkShcdYODEhdAmpi06qggM0CRDh2uk9cig08CfGR9IwS6I7FrjOhrA21S/Ha
         3q6AESrUe/m71fAr/JL46Q5WifosBjVvMmVhLxXxCpzwV0eDdbMJBLtQ+QlaqJTJbZLr
         kuGDziSOL8gt3TA5wE2uuyW87br6DBTCSrb38MXfflwIiINzCVg34X543rpZPA2YSpPe
         4deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728668941; x=1729273741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O4Puqlsgo3JtkM+YPUI+9BBuYWEnXPV4jctacnOAOZE=;
        b=cq99Jx9xq5Cs8X+gIE3utYvuBUn6P4LM3YrKbXEt7I2hUwaFeH/wTHRp8X73HCLonb
         eON3JLkDVvV8+Q2MIBbI3ztaekwXMmIo0KCMRZuWfPaUlsKqCKAH3SpVsYqe86XBgJwz
         2E4tb3w4kHaVoKKy+16n0IHO+clh4DJgWRqAQUIwnYbTH2uzm488PTFExlCNqw8NKWTM
         IlZj4N8DzzJaa6JQvfA6sqZhXNSKbFQ1EDrmCG5g8oOO+8OpJ3/8DpX/7wpfrncMOpTx
         QSgxG4d+vKZrqUyYaWxLquzyZR2IvdDOfF93b3pP5qGQ0VuFIqJ4fszAdW2T53QCyGmi
         3s+Q==
X-Gm-Message-State: AOJu0YwkrFwva17MdUF6I5p3u0NmB8UyLNvDFoReeR8Rsgbz8uPpsKYL
	pUSvJStVGVxq8OjVBDbcc9Kq/1AAgSHQNSI/+4NStZtUHhW/AQ7iXE5T0c2Shz1srpbROMwwinp
	QQ+Nld613s5fla4oczlvrbw==
X-Google-Smtp-Source: AGHT+IFKZwPT4nRs/hQvsvgdY0QnpNCfc2Cp+dGR3RRjJ02mIyKjnlinyvV7IUArewi91fk8TwEvDoo5enr7Y7PsTw==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:146:b875:ac13:a9fc])
 (user=ackerleytng job=sendgmr) by 2002:a25:74cb:0:b0:e11:5da7:337 with SMTP
 id 3f1490d57ef6-e2919d9e4e2mr6967276.3.1728668940575; Fri, 11 Oct 2024
 10:49:00 -0700 (PDT)
Date: Fri, 11 Oct 2024 17:48:59 +0000
In-Reply-To: <d54f9b64-fc9f-4b63-8212-7d59e5d5a54d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <diqzy12vswvr.fsf@ackerleytng-ctop.c.googlers.com> <d54f9b64-fc9f-4b63-8212-7d59e5d5a54d@redhat.com>
Message-ID: <diqzv7xysf78.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

David Hildenbrand <david@redhat.com> writes:

> On 10.10.24 19:14, Ackerley Tng wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Ahoihoi,
>>>
>>> while talking to a bunch of folks at LPC about guest_memfd, it was
>>> raised that there isn't really a place for people to discuss the
>>> development of guest_memfd on a regular basis.
>>>
>>> There is a KVM upstream call, but guest_memfd is on its way of not being
>>> guest_memfd specific ("library") and there is the bi-weekly MM alignment
>>> call, but we're not going to hijack that meeting completely + a lot of
>>> guest_memfd stuff doesn't need all the MM experts ;)
>>>
>>> So my proposal would be to have a bi-weekly meeting, to discuss ongoing
>>> development of guest_memfd, in particular:
>>>
>>> (1) Organize development: (do we need 3 different implementation
>>>       of mmap() support ? ;) )
>>> (2) Discuss current progress and challenges
>>> (3) Cover future ideas and directions
>>> (4) Whatever else makes sense
>>>
>>> Topic-wise it's relatively clear: guest_memfd extensions were one of the
>>> hot topics at LPC ;)
>>>
>>> I would suggest every second Thursdays from 9:00 - 10:00am PDT (GMT-7),
>>> starting Thursday next week (2024-10-17).
>> 
>> This time works for me as well, thank you!
>> 
>>>
>>> We would be using Google Meet.
>> 
>> Thanks too! Shall we use http://meet.google.com/wxp-wtju-jzw ?
>
> I assume that room cannot be joined when you are not around (e.g., using 
> it right now makes me "Ask to join"). Can that be changed?

Thanks for testing and pointing this out! My bad. I've changed the
settings to make it open to all, and tested it using my personal gmail
account.

Please let me know if it still doesn't work for anyone!

> Otherwise, I think I can provide a room (Red Hat is using Google 
> Mail/Meet etc.)
>
> Thanks!
>
> -- 
> Cheers,
>
> David / dhildenb
