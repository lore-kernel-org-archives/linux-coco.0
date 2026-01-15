Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC23D3302
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768500373; cv=none; b=sFEuPQgorvEp5HlWfd5rCnVdp5r0wI6a3/zWPyf1DUhDmBsEHWpPXxQJmG/y11bcP6IXsjJEzBte4b2JHSAPXcyIEitYcsQKFiREq9FKyngoJ7DtBTymQkppMR/R2bOUpHJ7SyUpk9IuNFWUV41Zdg8YuS07+S6TCOpqQF+vziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768500373; c=relaxed/simple;
	bh=Exppa+fvFnZDSzfgEoO0isPt4brqzr+0/NQtFqU7kXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CLBWs6PkR7MBhJvQCyDV/fbjXU+fmuq8r8+iTFhpQy3k8mWhVLs8kS70P+I8tirzO7HttHUxA5RFVvYXbbEv9mNY48V701t71tViscaUUEy86rFsIdTv+0jpLZwTp1+aGcKIp+ETYvp/2le5BDQqGhh1iquysTwvyg2Mp4nP3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKveCTMi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKveCTMi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so1341481a91.3
        for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768500371; x=1769105171; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uqUPVaTEkff6wsfE3L2bqEiARCuGC2uqb7juZRSNZw=;
        b=jKveCTMiSQM2m4gqdAwSl9/rYblrtM3tMjAJzVLtp61QM/EMZNS7y7/PdLzX6323eO
         fBY9Aup60shcs6ds3tfgYHrQqE5BJFpCLRmmwIB6bGNg+DUxLH5goInJaA52BpP1KzE1
         E3jeWtyjPHtA7q+3coZgM9Hcs1c7WWPM5vaxomupCIhkY01jynG2pi2DvLBAvKPQJhpE
         POiY3Ge4KKDyDcFQ4ZsVOaA5Yj9qEgPVYKjQB0j8pclRGECXjlvPJCzPUDuefkh++IRI
         BfTSApX/ybaLg9FZHLJXL9g9yF0oe9yYChwhgGF5gIXFSBze6yyXlYEYA/6zuCXTBBB0
         kLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768500371; x=1769105171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uqUPVaTEkff6wsfE3L2bqEiARCuGC2uqb7juZRSNZw=;
        b=MpYF3vu3xTfMdyzzkrtax1LaE4crvEnbcDE/N21/v2ekDz3lbDy/GF2ZN0gDTeycN+
         sqHXqzvvlwdn4NhMu77n+WlTh/ngtpusKgaU0u1zC9DsH+HQpnHJfW69jXdTNG7GC1p6
         JJCQ7Ck0nw4TeeVgvF4Ed3V8VZwXZ0FEWcP86sg3aatE3nEnv2GtueqqGbWUAwHrXpu+
         vFP0NP6QjriNYylEg3B07TeNhXBpNltM7KSQS3c0j/SoXhNFCWuR8ehhURXMTt8F19p5
         OV5MHKEQOmg5Ad7EfCYtw47iM8eYyj1C91hn2NvcZRckLZPdZrAngn0vQ+a/7XuzKVrd
         akQg==
X-Gm-Message-State: AOJu0Yz3H8e8AFdvDE2JXXmiB3aMGh+qpACIemN89wxY8X0iQoa8jwtD
	7oAH2Yd+CnQ4KqYE97XeSUEIaZE82d55bH4XCVzKiiOQ2+w8/c49SVz/T+ln/hIVRRnjur4jfjx
	N2ZtZPA==
X-Received: from pjzg6.prod.google.com ([2002:a17:90a:e586:b0:34c:2124:a2b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37d0:b0:33b:8ac4:1ac4
 with SMTP id 98e67ed59e1d1-3527329c896mr168776a91.35.1768500371573; Thu, 15
 Jan 2026 10:06:11 -0800 (PST)
Date: Thu, 15 Jan 2026 10:03:23 -0800
In-Reply-To: <20260108214622.1084057-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260108214622.1084057-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176849903000.720660.2401438098975748028.b4-ty@google.com>
Subject: Re: [PATCH v3 0/6] KVM: guest_memfd: Rework preparation/population
 flows in prep for in-place conversion
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Michael Roth <michael.roth@amd.com>
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	vbabka@suse.cz, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	vannapurve@google.com, ackerleytng@google.com, aik@amd.com, 
	ira.weiny@intel.com, yan.y.zhao@intel.com, pankaj.gupta@amd.com, 
	David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, 08 Jan 2026 15:46:16 -0600, Michael Roth wrote:
> This patchset is also available at:
> 
>   https://github.com/AMDESE/linux/tree/gmem-populate-rework-v3
> 
> and is based on top of kvm/next (0499add8efd7)
> 
> 
> [...]

Applied to kvm-x86 gmem, with the tweaked logic I suggested.  Thanks!

[1/6] KVM: SVM: Fix a missing kunmap_local() in sev_gmem_post_populate()
      https://github.com/kvm-x86/linux/commit/60b590de8b30
[2/6] KVM: guest_memfd: Remove partial hugepage handling from kvm_gmem_populate()
      https://github.com/kvm-x86/linux/commit/0726d3e164f1
[3/6] KVM: guest_memfd: Remove preparation tracking
      https://github.com/kvm-x86/linux/commit/188349ceb0f0
[4/6] KVM: SEV: Document/enforce page-alignment for KVM_SEV_SNP_LAUNCH_UPDATE
      https://github.com/kvm-x86/linux/commit/b2e648758038
[5/6] KVM: TDX: Document alignment requirements for KVM_TDX_INIT_MEM_REGION
      https://github.com/kvm-x86/linux/commit/894c3cc35b89
[6/6] KVM: guest_memfd: GUP source pages prior to populating guest memory
      https://github.com/kvm-x86/linux/commit/ba375af3d04d

--
https://github.com/kvm-x86/linux/tree/next
