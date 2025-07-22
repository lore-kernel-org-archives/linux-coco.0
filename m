Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627F922CBE9
	for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195509; cv=none; b=LgUAH7i/w7sEQHSD3DCnXpCTO8lFka7Qg+c8dZb+jhl1p9yNsLMptft9kx7IYwEBbxS3sHxjdPxc7ESgTYhWgiAKDLJstGR5gwkjLND+TCc1tdGXXawhnZSHvRx9QntYFOlAAHMQmIdT4sihdQoSlRdKQdmwG1p5rjpIPaXOHU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195509; c=relaxed/simple;
	bh=HVfN2TYraPSfCxVo0AJHXJQLDHAZdY3bb6bzfYt4LeA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rtjd/Rr+FH4jFCIKsUf6JBmdPwFFvOplJQJPG9ue5LYJweKFQydYqg1FpL8iAe0TctsxUfjDn0VOk7i6m6hOk0IsszK4bxEtyPMKFBO6ruYOrUODHXa8w7i3WNFmcvXZyKcfDBLNcumbqIQpsWqPzLWrLAh8sSeyyAiqUIMdZqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3gxKt51; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3gxKt51"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74913385dd8so7955691b3a.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Jul 2025 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753195507; x=1753800307; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZgPKLrP/qotO+TNh068TYlpA/4yneLkKMwvnezIBBc=;
        b=T3gxKt51Eu/UBOYlDWE13H9u/D4sNmDsUoJTp7diiSydT2mU2wJQvO4MopqpxpdhnQ
         bQgdyReIXoOFawQ6D3ciTxZ11l5S8Edre2oXsa6lrthZgwGnWYWT6Vi7ynSNBVef6vCQ
         EhMJ8zkhcLw/zd0HHQieznQ/q7xL2QiuX8mG9QjGeIaQ2OZEcbmwzBIJ1vGnYreuzhYJ
         E3h0X46uEOVcUgIwPt143IZctxZUNFOzukBmTHJjLI6pm2OkbpyetVhaBfugTC2CvjaS
         CVAq8IVjUePReqxPYy8eBBeQbq8FfKbdfzJTe+DmqlO4gUBbVn0BKna8675iBwyvn65+
         vjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195507; x=1753800307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZgPKLrP/qotO+TNh068TYlpA/4yneLkKMwvnezIBBc=;
        b=pH67Fr819t+eXhNVxGxos7Z5fo9OmWUSVGkU6UuBJitAJFC9qOOK82KwypLpWpx9hi
         jHqZv9vLqYZ9bA5kSa9u8S8uRj3UfxmRwqsCjLofHy7GlPiFuTB+uC+NeyVywfBFsUDE
         gEQOUSL3rFQJjZa08gLvgenrweVJrWS8vWzwrFAbPqVZ1rfmLl5btYXyEqL50AdZ5Dnf
         UadlIf3T/AVn/1YOmFKnX/xG2X++IiFUpE1iS0s5taWjj9X8+dyO5P7OngAunhm1Jfr2
         G7nYb1lDX+ZyYTCDBAFeRv5fNHfYwARSo1ylsL5iUukagwjdMTdGXDgQFGkrl887fNV/
         +glA==
X-Forwarded-Encrypted: i=1; AJvYcCXAuGACgWim3bmk+EnV4GlS+UQadh6XaVlUG9d0gQUHjvINQJi+K1ewZl8HWgFzWz99FDxf/2n6UMSM@lists.linux.dev
X-Gm-Message-State: AOJu0YxULrjPnK7lhMNmYUD2mwwTKLeIDDdSUcbA0pVcK7ohAm0nkPUO
	48xeaba2+Ey6XwOFThgcNPz7SWNS/hU4XMdNJyJkaRCIbMbCxOCeK/DOpjLCAzwgWYRDj1NaqsL
	sJRyODQ==
X-Google-Smtp-Source: AGHT+IEye6ryF3i4GwrrW44YhrNpbw96+Sg2XleT9SYl1PadbAW/x1ROmWdG2BYhq8vejYeKBT2EUnzq5Ms=
X-Received: from pgbfm10.prod.google.com ([2002:a05:6a02:498a:b0:b2c:4fcd:fe1b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1508:b0:220:94b1:f1b8
 with SMTP id adf61e73a8af0-2380db8e8d7mr31142351637.0.1753195507419; Tue, 22
 Jul 2025 07:45:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 07:45:05 -0700
In-Reply-To: <bdce1a12-ab73-4de1-892b-f8e849a8ab51@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250713174339.13981-2-shivankg@amd.com> <bdce1a12-ab73-4de1-892b-f8e849a8ab51@redhat.com>
Message-ID: <aH-j8bOXMfOKdpHp@google.com>
Subject: Re: [PATCH V9 0/7] Add NUMA mempolicy support for KVM guest-memfd
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Shivank Garg <shivankg@amd.com>, vbabka@suse.cz, willy@infradead.org, 
	akpm@linux-foundation.org, shuah@kernel.org, pbonzini@redhat.com, 
	brauner@kernel.org, viro@zeniv.linux.org.uk, ackerleytng@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, 
	bfoster@redhat.com, tabba@google.com, vannapurve@google.com, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	shdhiman@amd.com, yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, 
	kalyazin@amazon.com, peterx@redhat.com, jack@suse.cz, rppt@kernel.org, 
	hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, kent.overstreet@linux.dev, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	aneeshkumar.kizhakeveetil@arm.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 22, 2025, David Hildenbrand wrote:
> Just to clarify: this is based on Fuad's stage 1 and should probably still be
> tagged "RFC" until stage-1 is finally upstream.
> 
> (I was hoping stage-1 would go upstream in 6.17, but I am not sure yet if that is
> still feasible looking at the never-ending review)

6.17 is very doable.
