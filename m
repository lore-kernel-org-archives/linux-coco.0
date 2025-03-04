Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4C62C154C
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107564; cv=none; b=EcUqm/j29Lei1jTeQyLJDis8WSGghPwiJVpGz4eQdn9FSLIds3g699r0BTGHocQeslWEp8lMi4pcKOpmLK8+kI/G5Bv5iEYGB3av7EDQYHd0CE8741C7NieowTK1KnvIO4UbjOg4bVgE17YbDbR8dlkkoEd6BJH3r3LRUbRhtEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107564; c=relaxed/simple;
	bh=NMceGXU1AayKIvYDDDytTT9zM6ePfplkGhj1Gwrp0Tc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mccJJ5+GmU3r6fM6budCpTtTPyQUGks42AB2K1oK7AQVKZCSXHPT+A24vSOgk53LP4ITxQsL+ea/eLkJMmk8581yrhoROTDxiZS+IwBRtJF8mW+Qe/xhL8zxsIKQKjy2C2YJQ+TDNmo4BzO9aptHrLPXg+A/LhRVmSoPej7LwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQb+SXDh; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQb+SXDh"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22387acb40eso97044065ad.3
        for <linux-coco@lists.linux.dev>; Tue, 04 Mar 2025 08:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741107562; x=1741712362; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7W7yQmf61Pq53pMS2vzrgU7eZq7ZkAtUnxQ4fLwZP8=;
        b=lQb+SXDhfbQjFugXRveXBwO+gC+Fd6ak3ZlQa3KL3A3kIU9CxCahNnm15GGiW1d9Fc
         f8ykZfip5j19dtzdC0k+kLhwl5PK+Oj97MbHovpgn9bfRGhn/vpY+GsIu+vfhy/B7kY/
         frqyFRHq9SFKyXbuA3GVK0jNm5y+2WGY95fTCFpxuWP+WRVw1SgqguP03gKihE2AZSHl
         RUS/VbvMT7RKAWqeGNnM5S0+nGgtuyeM+cj3hXz3lHb4HlhZ5FI9s+GEKVPuCgPiqb7h
         hNNfHGaGvXCIUTqdusYVD6tbcsNxMV3Tfsn84w6XTVD6BoEFKsXMhLt9kVcg8TFqMdr0
         Fyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107562; x=1741712362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7W7yQmf61Pq53pMS2vzrgU7eZq7ZkAtUnxQ4fLwZP8=;
        b=gSQNtcp+Ieqc+8jgyX8wWCOXRFoDBeLCvBFUMupUZXOkQTrN8oOIlvvWNf9puqmr0+
         auK0BLF6MVdiIwzgOqewRzmEdZUvVmbSfcXBetAi75w8jRLBkknw3JdQ9OUKK83eIyrK
         wafMwvI0dyBuwSLRKZqqUIjK0sE/QqrGCY2jUvRbmusrhzwXBgdOSh9Holzw5z7nVfI3
         kF/mJKjHYaiQnRIJKznpB5WJmpwf4ib+udQuUZ9PZCMuqwSXG2dRkjOV4BxpynWQZyNM
         cvn7vvqukQklkm/ULBjwsMqodJMYJY9guiErm5nvpN3w6ob8nScEH6C4UoNNdEiqqll1
         XT1g==
X-Forwarded-Encrypted: i=1; AJvYcCUcrp30tiZImRq+uiHRJ1dt2Sa/T6t0QR8FwxDMn7OLfgjrHgxXQqPmiCR+1WoecL2v9GflYf+42yGQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyZzjlEIkko3L+amdfY3aI4TCcS7s6uFkmu9yocEwugbD30zsb5
	scVZTGR6JB5JaauhOiODI5z2I/YDH0yZ+3ZREtyS8VJHuOM58Xt06qa0unAxyRBYA0nxTxdTV1A
	VTg==
X-Google-Smtp-Source: AGHT+IHAFrEgPQdnRru2RpcA9ojFQVDAwMfLY/u9ofYMqa8EKlltfiiKVsKJDm4SpBm3Hx0wphR2ehXHeKw=
X-Received: from plbju14.prod.google.com ([2002:a17:903:428e:b0:220:e84e:350c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b83:b0:221:7955:64c3
 with SMTP id d9443c01a7336-22368f9d123mr262199705ad.23.1741107562128; Tue, 04
 Mar 2025 08:59:22 -0800 (PST)
Date: Tue, 4 Mar 2025 08:59:20 -0800
In-Reply-To: <9d04c204-cb9a-4109-977b-3d39b992c521@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <b494af0e-3441-48d4-abc8-df3d5c006935@suse.cz> <diqz8qplabre.fsf@ackerleytng-ctop.c.googlers.com>
 <Z8cci0nNtwja8gyR@google.com> <9d04c204-cb9a-4109-977b-3d39b992c521@redhat.com>
Message-ID: <Z8cxaGGoQ2163-R6@google.com>
Subject: Re: [PATCH v6 4/5] KVM: guest_memfd: Enforce NUMA mempolicy using
 shared policy
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Vlastimil Babka <vbabka@suse.cz>, shivankg@amd.com, 
	akpm@linux-foundation.org, willy@infradead.org, pbonzini@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, michael.roth@amd.com, 
	tabba@google.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 04, 2025, David Hildenbrand wrote:
> On 04.03.25 16:30, Sean Christopherson wrote:
> > On Tue, Mar 04, 2025, Ackerley Tng wrote:
> > > Vlastimil Babka <vbabka@suse.cz> writes:
> > > > > struct shared_policy should be stored on the inode rather than the file,
> > > > > since the memory policy is a property of the memory (struct inode),
> > > > > rather than a property of how the memory is used for a given VM (struct
> > > > > file).
> > > > 
> > > > That makes sense. AFAICS shmem also uses inodes to store policy.
> > > > 
> > > > > When the shared_policy is stored on the inode, intra-host migration [1]
> > > > > will work correctly, since the while the inode will be transferred from
> > > > > one VM (struct kvm) to another, the file (a VM's view/bindings of the
> > > > > memory) will be recreated for the new VM.
> > > > > 
> > > > > I'm thinking of having a patch like this [2] to introduce inodes.
> > > > 
> > > > shmem has it easier by already having inodes
> > > > 
> > > > > With this, we shouldn't need to pass file pointers instead of inode
> > > > > pointers.
> > > > 
> > > > Any downsides, besides more work needed? Or is it feasible to do it using
> > > > files now and convert to inodes later?
> > > > 
> > > > Feels like something that must have been discussed already, but I don't
> > > > recall specifics.
> > > 
> > > Here's where Sean described file vs inode: "The inode is effectively the
> > > raw underlying physical storage, while the file is the VM's view of that
> > > storage." [1].
> > > 
> > > I guess you're right that for now there is little distinction between
> > > file and inode and using file should be feasible, but I feel that this
> > > dilutes the original intent.
> > 
> > Hmm, and using the file would be actively problematic at some point.  One could
> > argue that NUMA policy is property of the VM accessing the memory, i.e. that two
> > VMs mapping the same guest_memfd could want different policies.  But in practice,
> > that would allow for conflicting requirements, e.g. different policies in each
> > VM for the same chunk of memory, and would likely lead to surprising behavior due
> > to having to manually do mbind() for every VM/file view.
> 
> I think that's the same behavior with shmem? I mean, if you have two people
> asking for different things for the same MAP_SHARE file range, surprises are
> unavoidable.

Yeah, I was specifically thinking of the case where a secondary mapping doesn't
do mbind() at all, e.g. could end up effectively polluting guest_memfd with "bad"
allocations.
