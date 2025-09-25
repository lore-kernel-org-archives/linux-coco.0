Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9332727E6
	for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807711; cv=none; b=CkW/y6mNPfbhbnaIxgxkBVYSf5yRQruZvJhrMqt/7LRJPm6qqSPAw5wfiRvtJSqQoXImDv9pl87dGBA6S0v4VuJtMyGVmTDY/i9zMv4U39aOLL7dNdzQ2jfemdc9iohWIcziE3aC0xLBjTAOcQ55CiT7cOBxwiAFzbEyIVufKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807711; c=relaxed/simple;
	bh=AY4CdJYGfM13VOROhcQg+Kh48EgBR5zHwAOZ2HsNQ/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=THYx/5zDb+OmO+1OqerqYxpSxV35k8nsGxzZncpnq+T1q/N8khQMZV7UgUyEAcb01KYx0gV94ORyf3XuZT8fZIQmCKsKvdCL6p5E/4TgTLu9y9jmu87AlgiqYjz41CIkXU5L154IpUX9gjEO9cfkQ8m1cqHCv2CczbUc3AN1IE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tTL1PhnL; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tTL1PhnL"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so980506a91.3
        for <linux-coco@lists.linux.dev>; Thu, 25 Sep 2025 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758807710; x=1759412510; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=;
        b=tTL1PhnLy606EBZx/Zdk8uGdGRkyKieHuUunSqKl5cIJsvhtpoCZQP37Emwf6HVuaW
         KqPqJ1qFnhDHK7lhBF2t0AyksjmUJlJQkDZDCSTMUCXX/ufREi0ZKGi+I83l5zqMOWi4
         eLtCPhOno9iwEkeoeGG8wqMyyJUDJaM+3Rh3grQRdUsUIqBPOC13YBcAuRnKsmxW1XW+
         WLmsiS1giFbL3eJFvGPHYaDjEq/dZlQrqkhgvSspzaOtwalw0IKawnF0uGiX3JeW8wki
         1lW9f9Hvs6DMDX8UBA1QTSyS96GtxNLq2Cj4racOibw9MUxzQuySxDqko218vtBGZL2v
         8Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807710; x=1759412510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dU4j5xINCBqy1Rj7i7G1Vfx3gRcoZTHMrIeb9JUSMNk=;
        b=Rb7zJaxx6UzirQDtzWVXxEZb0sITX+tPnS2lU1mqkJagO5I1N14AahfsTA5TMKqjCq
         mQhwCDYBOKvY7cfU0zOmfFrZzYRwD5pk0NQJyDQhrSGBm0p1GNUDhz+RmyEXq+1wexnG
         yiUK9Rg2KuREMLoKY1sx8BwGxl8X4kUS0ryk088gW8i/qMENTphNnfQbjlcJ+cWXhMSY
         IfJA1QIEgbzn8ugtwAQHVIcEPvrps2SGLcj4wp+mqal8YYvWzfL6fQstSY21skby/vLC
         ziG9hbPYbJpAYhtEv5BgRjeex8kGb34HkWPrBw8UYY1wwg4sLhtfZteso2ySZsHzk2Hb
         DrNw==
X-Forwarded-Encrypted: i=1; AJvYcCWsO44Fhg4Z9YMYTpRxODkzkY+69+NytsQo6kcIigRwMp20GOoZLij7FwXiAkKRQ9xbhNXLOZya+jW6@lists.linux.dev
X-Gm-Message-State: AOJu0YzWWPiT86rXxw0pclFYQjK+Qjm8fZMg6E6aoBgl6eoJM6HIJG+T
	I1oV8qidEDWwSiN1tmhXmskWU5lBoYJ4iTbiJy/PAlJ4vJ3SaTANaKsVlIJ9nXDvaOko57UiPeV
	ob4kY2g==
X-Google-Smtp-Source: AGHT+IGEjcBsUTlo4/vVd9aOmfS85HeXK7VXkMsc2AM9X82gWAt19f8n9mk94PI8ByiZcVy2ayMJHM96hBY=
X-Received: from pjbjx4.prod.google.com ([2002:a17:90b:46c4:b0:330:88c4:627])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c4a:b0:334:e020:2f16
 with SMTP id 98e67ed59e1d1-334e0202f83mr1618309a91.11.1758807709301; Thu, 25
 Sep 2025 06:41:49 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:41:42 -0700
In-Reply-To: <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250827175247.83322-2-shivankg@amd.com> <20250827175247.83322-7-shivankg@amd.com>
 <diqztt1sbd2v.fsf@google.com> <aNSt9QT8dmpDK1eE@google.com>
 <dc6eb85f-87b6-43a1-b1f7-4727c0b834cc@amd.com> <b67dd7cd-2c1c-4566-badf-32082d8cd952@redhat.com>
Message-ID: <aNVFrZDAkHmgNNci@google.com>
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
> On 25.09.25 13:44, Garg, Shivank wrote:
> > On 9/25/2025 8:20 AM, Sean Christopherson wrote:
> > I did functional testing and it works fine.
> 
> I can queue this instead. I guess I can reuse the patch description and add
> Sean as author + add his SOB (if he agrees).

Eh, Ackerley and Fuad did all the work.  If I had provided feedback earlier,
this would have been handled in a new version.  If they are ok with the changes,
I would prefer they remain co-authors.

Regarding timing, how much do people care about getting this into 6.18 in
particular?  AFAICT, this hasn't gotten any coverage in -next, which makes me a
little nervous.
