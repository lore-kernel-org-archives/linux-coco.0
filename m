Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF32E5418
	for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758812809; cv=none; b=XVCjOXUXQMfQravnDEEBrVHC01h6SukmAnh1KZPcIjTcHhNJP8M5eQRX1Lc0IBgGLxWV410abfrSiGdlMohPRPqIVASpeIUTsZw0z+MXdxLuCwuVks5kOmJkUT8WMXoGAAd4Cc4M7tXU54a+Vbt0EIATUPDYQc1rXDGZp8II9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758812809; c=relaxed/simple;
	bh=0EpGH4MwDbcizlCggFCTnPr7IrP4J3CDCKfs8jvP9TY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ivsSwwP6fsCdMNRZcmkuOSV24OCOO9sJguAiAQQTc51iTGWvcYxa4TjKwr1poWeXGKPm3xuTT5iDuv8LBmgrmcs04QIN29zYtTmcPxLhxd6QsrFGBU2kdXElKIvfuJBFP+/mi6a9iDV/dSM/R7LF5blvY1pTaHRHJTmCPVw1e64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pq190gP4; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pq190gP4"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b55118e2d01so796203a12.1
        for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 08:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758812807; x=1759417607; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=;
        b=pq190gP49q0KwGMFIdIZt9XJnE37zZ9n8GwjtR3qD1yEJ0skIzOOI1XBqbUwFyhyEL
         LLd9N5RhRaj1ftRJ/3eR3hZRzdJQvUAnRo6kjqrx/BHRyICBPZmer796Dd0DAiEZfeX9
         lEisRM0PSnBp8tcJs1m5jkG8EEn2P3JOafeKubsqPT+888dMIdY1JsjUCeSfq+yLynD9
         ndTZUT6qoSh8HScOK/YrNc2RakTneomfldfeZMXUSHjA2CrGigVN78CKNVeONGcyj4Fs
         07S4FdiDQ0E9YE1HxIN5FzPZ1raiiTnD3aMNAZ2du+noOw8BXITnUSr1ZpUeIDGHtfMN
         J1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758812807; x=1759417607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh5MSqTLsjrp4fvoa9f2K3rue2zEjmwO4t9rR+bj9fI=;
        b=NEtxyPzDCfzsqMlJHY2EQTdGixw47kaL4cH9/930HQ1hPKPQgzrVOQT7Fpj36w2P+/
         rMt9WuObEVr2HC5sZjSYKwum0RR0gZX6/fIRr0OS7Dw8ISfmMmapwQr27qNgVWLLyoEX
         tHTlnJzQRIpEDvXGxXbOjbahEHzezEjvhErDoQqYiRPLBY0S+fFk+Tj8f3kiRCBMYyQ2
         D6un/hnU6VjXMxiJCeShj4evgg7s98GFT1lkY/xtVWqeMUnMVBcr4RnaXyE4Opm4uDia
         GWWwuu2spmxlIfNSyNueKpYGQQrxeEgnDyaWBA/Y4QDX076uQoCN9Co99rZXYTM6Y7Ys
         JyrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJYVAuawQBFG/wraWYFngQEedHW6YLioE/kdd2Y/fFmiKZOBtBrKpm4DA6Qi4YkHqwTCUnewinkKpz@lists.linux.dev
X-Gm-Message-State: AOJu0YzQbp1avB03rrTn22Q4ZdN8Gt7125r+lC3W6NPfqffJyRfADyrU
	/fXkXKtwSdKhtoK0ocD9VrQes0H0tm5mL1jE3cXz0Vq5SmVI2X2lc6sdyRC4/SX6aQ6mUc5gCVb
	E8yTAkg==
X-Google-Smtp-Source: AGHT+IEVcWsyGM1w0GH1nNrshkk20Pnc8ghwxFB8MAUOFgcR14npidYwrEDITe3+YHWa4Mb/5XspEYhl1Ac=
X-Received: from pga11.prod.google.com ([2002:a05:6a02:4f8b:b0:b4c:213a:e7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3282:b0:262:1611:6528
 with SMTP id adf61e73a8af0-2e7cdda0840mr4939471637.29.1758812806367; Thu, 25
 Sep 2025 08:06:46 -0700 (PDT)
Date: Thu, 25 Sep 2025 08:06:44 -0700
In-Reply-To: <3a82a197-495f-40c3-ae1b-500453e3d1ec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com> <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com> <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
 <aNVFrZDAkHmgNNci@google.com> <3a82a197-495f-40c3-ae1b-500453e3d1ec@redhat.com>
Message-ID: <aNVahJkpJVVTVEkK@google.com>
Subject: Re: [PATCH kvm-next V11 4/7] KVM: guest_memfd: Use guest mem inodes
 instead of anonymous inodes
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Shivank Garg <shivankg@amd.com>, Ackerley Tng <ackerleytng@google.com>, willy@infradead.org, 
	akpm@linux-foundation.org, pbonzini@redhat.com, shuah@kernel.org, 
	vbabka@suse.cz, brauner@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com, 
	xiang@kernel.org, chao@kernel.org, jaegeuk@kernel.org, clm@fb.com, 
	josef@toxicpanda.com, kent.overstreet@linux.dev, zbestahu@gmail.com, 
	jefflexu@linux.alibaba.com, dhavale@google.com, lihongbo22@huawei.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	tabba@google.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, 
	pvorel@suse.cz, bfoster@redhat.com, vannapurve@google.com, chao.gao@intel.com, 
	bharata@amd.com, nikunj@amd.com, michael.day@amd.com, shdhiman@amd.com, 
	yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, 
	michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, kalyazin@amazon.com, 
	peterx@redhat.com, jack@suse.cz, hch@infradead.org, cgzones@googlemail.com, 
	ira.weiny@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	chao.p.peng@intel.com, amit@infradead.org, ddutile@redhat.com, 
	dan.j.williams@intel.com, ashish.kalra@amd.com, gshan@redhat.com, 
	jgowans@amazon.com, pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 25, 2025, David Hildenbrand wrote:
> On 25.09.25 15:41, Sean Christopherson wrote:
> > Regarding timing, how much do people care about getting this into 6.18 in
> > particular?
> 
> I think it will be beneficial if we start getting stuff upstream. But
> waiting a bit longer probably doesn't hurt.
> 
> > AFAICT, this hasn't gotten any coverage in -next, which makes me a
> > little nervous.
> 
> Right.
> 
> If we agree, then Shivank can just respin a new version after the merge
> window.

Actually, if Shivank is ok with it, I'd be happy to post the next version(s).
I'll be focusing on the in-place conversion support for the next 1-2 weeks, and
have some (half-baked) refactoring changes to better leverage the inode support
from this series.

I can also plop the first three patches (the non-KVM changes) in a topic branch
straightaway, but not feed it into -next until the merge window closes.  The 0-day
bots scrapes kvm-x86, so that'd get us some early build-bot exposure, and we can
stop bugging the non-KVM folks.  Then when the dust settles on the KVM changes,
I can throw them into the same topic branch.
