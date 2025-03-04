Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174024C062
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102223; cv=none; b=khUDC+wLUslFd4xngpwFAeJUHPRjouJ/5QLla8il4/LZcw8+KycS8qt8qgXub3Rx8/piJgm2kamQoh96AECVtlHt/9oc4vJLsy5xfNZhLb4L8jWOpRz/XRh6NXqC5ZYqs0RP3Se24PZ2WV4+MID8YeGbHcjdHr1Y3TL4ilAFtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102223; c=relaxed/simple;
	bh=pCfGtvk96jzYY0aDPo6UzD5wZN4EHA8IEklxkYVKezQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vk+uAitTXXR2UZ9MJReeCe7j9O7IZyIJWnne29SMi1Rgs9XPzBk4wvGxdZNw6uzyZwrBo9o6QmIaAVYb5JJBbXEUx07bFfkLh4kbfl9cio3o6qf4PXxec3SigmoYk9Dx1m2ft6b+7hoRALQYCmNUk74rvhjn9sjJSg6DgU0AO+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtMId/kj; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtMId/kj"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2feda472a7bso5683069a91.3
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 07:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741102221; x=1741707021; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvg9RGNtgXTSILk0IdpR94FQL1jxJC1gyLgPdqw8XU0=;
        b=DtMId/kjTNMzHd0Fck46zAWkY5C+lrmoIWcXStxlvzY0DBtcUS1E74+l5Q+8QnYCkY
         ul55QanQqHwvuoZLQfg6X9tSeeyvb7eKfiYN9yNbBHbbDtETiYA7ytrgA5ElBbYhgDfI
         2K+tW6rzCEoAzBtoIC8PQBh8M8/gUUcLGi3HJ0RiC8vPoFB507GKTPjn8ry6K4gIZcJT
         MpRBlug115ZI0LX9SRYIDFKX9KGPRg7ix9Q1hM14pOGeS0JKV3b/4N+6zK5DK6jGtEtw
         8iLMVRVNXPmdvvdHwEz3PXOOfT36wkzWb3ileEt7ilStS2TtkG+VxvWO0KM0FDshqHuH
         dmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102221; x=1741707021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cvg9RGNtgXTSILk0IdpR94FQL1jxJC1gyLgPdqw8XU0=;
        b=Qe367a7YWL++8TT6iBYgFLHp3ypzGs1yV1uj4lZ/68QCUptm6dfJZwYeocqOPLb3gB
         DgCQ+WrC5gd3gH73FbjgLywwgc7bDrjFRbas9CO1O6fZauxVo2uTZPq5ZOHX4sRTHJ/L
         rnt6Xvm7J6gV5duzNsrzvR+f0doUa9uHJiVnjVYTycIxumduAgkPpbK5sPqHORqLeZDj
         p7c9hqUgSMPkDs2Idj6FKgu1YBnTKfQuJHtOkOLI7keT6ln2E2bDE4spjMlsOw5dJH/S
         w89vXWKJ3dHa8z9KBNqtNSdI3pl7aaGybDBHeEjJH2EpKWnAplie5TCYJBWLQbstHvAW
         RVXA==
X-Forwarded-Encrypted: i=1; AJvYcCX2UEjq8Oq+yNo28N6mi9kYbJTFAb1DSHIf76/62VPPU1/WMpmqDL/mOHkoAqHSOLMw4E4UvDTWFpIl@lists.linux.dev
X-Gm-Message-State: AOJu0YwSlbZ5LSO6hwCEpD4Edoj+9oxfN8ecEfwnd9t0rHDS68PI5gWx
	8ZFimAkRnWtlpOq+j3qatQUwF6LacDn7xqUWITD+EN95kiKTJH3ZJ0pxaZSzoFen4XSYaudQERW
	nNQ==
X-Google-Smtp-Source: AGHT+IEM4E5/Zptus46DoKrgzz5+XTeSJ4hJIAQWQAIYRnIL9pjg60K5aKaF81Eu644JbhsDlC5832QLpoQ=
X-Received: from pjur6.prod.google.com ([2002:a17:90a:d406:b0:2fc:2959:b397])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c90:b0:2ee:db8a:2a01
 with SMTP id 98e67ed59e1d1-2febac10a9fmr26741760a91.30.1741102221273; Tue, 04
 Mar 2025 07:30:21 -0800 (PST)
Date: Tue, 4 Mar 2025 07:30:19 -0800
In-Reply-To: <diqz8qplabre.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <b494af0e-3441-48d4-abc8-df3d5c006935@suse.cz> <diqz8qplabre.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <Z8cci0nNtwja8gyR@google.com>
Subject: Re: [PATCH v6 4/5] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, shivankg@amd.com, akpm@linux-foundation.org, 
	willy@infradead.org, pbonzini@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, chao.gao@intel.com, david@redhat.com, 
	bharata@amd.com, nikunj@amd.com, michael.day@amd.com, Neeraj.Upadhyay@amd.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com, tabba@google.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 04, 2025, Ackerley Tng wrote:
> Vlastimil Babka <vbabka@suse.cz> writes:
> >> struct shared_policy should be stored on the inode rather than the file,
> >> since the memory policy is a property of the memory (struct inode),
> >> rather than a property of how the memory is used for a given VM (struct
> >> file).
> >
> > That makes sense. AFAICS shmem also uses inodes to store policy.
> >
> >> When the shared_policy is stored on the inode, intra-host migration [1]
> >> will work correctly, since the while the inode will be transferred from
> >> one VM (struct kvm) to another, the file (a VM's view/bindings of the
> >> memory) will be recreated for the new VM.
> >> 
> >> I'm thinking of having a patch like this [2] to introduce inodes.
> >
> > shmem has it easier by already having inodes
> >
> >> With this, we shouldn't need to pass file pointers instead of inode
> >> pointers.
> >
> > Any downsides, besides more work needed? Or is it feasible to do it using
> > files now and convert to inodes later?
> >
> > Feels like something that must have been discussed already, but I don't
> > recall specifics.
> 
> Here's where Sean described file vs inode: "The inode is effectively the
> raw underlying physical storage, while the file is the VM's view of that
> storage." [1].
> 
> I guess you're right that for now there is little distinction between
> file and inode and using file should be feasible, but I feel that this
> dilutes the original intent.

Hmm, and using the file would be actively problematic at some point.  One could
argue that NUMA policy is property of the VM accessing the memory, i.e. that two
VMs mapping the same guest_memfd could want different policies.  But in practice,
that would allow for conflicting requirements, e.g. different policies in each
VM for the same chunk of memory, and would likely lead to surprising behavior due
to having to manually do mbind() for every VM/file view.

> Something like [2] doesn't seem like too big of a change and could perhaps be
> included earlier rather than later, since it will also contribute to support
> for restricted mapping [3].
> 
> [1] https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS@google.com/
> [2] https://lore.kernel.org/all/d1940d466fc69472c8b6dda95df2e0522b2d8744.1726009989.git.ackerleytng@google.com/
> [3] https://lore.kernel.org/all/20250117163001.2326672-1-tabba@google.com/T/
