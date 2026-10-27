Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096980;
	b=O+iLMlnkNMT/N7E0DAojf/Pe3xcNkpQoc7kLx9GWbM5Vg18UkcK1HkIrVonmZ/u5dxsm
	 rBWHTD0ZGbxGsFe1gBUwFdjOsrBOn/JEdJw5cvGURE9ONec7d9EhFC9OQEFUMB73aZ2xm
	 wvvJxa9/NQfb46kydYOKiV9hgfwgyy2ZEOatq61K7oq3XZTRLsEVFx55c0ypbibIBjMLh
	 as+v59LoaNEMfnlBYYbpC4WqqauWC8uC8y7ngwuJ2/HCtYcDTbH4vYCbn/OkIF+GneQpU
	 RvC6eQCvoAjnLsLo0UEEdUfhXP9s4zw1y/uaAOzoUApE2k/0BV0QdFrLsNpJ+n9if+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096980;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
	b=dA/0aOmJtWsqTs6M01YW94Gh8tGeHwiWH4uhpwaKnAy2RU5F5xDuqlnh/5m7j9mZ+qkk
	 Hxn12OXD+omkbqHnSy0QZUCvoYU8+wmG8K4McE+fynNMqmfQjOBvkIeyl/BLmz040WCBY
	 +77YQIlVvuSkLLA5JwI3y0MHNX0tSv0j+umw/Bvi8q7AG8ut/Wiol2HH1rrRscyV4SNug
	 cu8iRa0+KQJpJrLj01yV7UYz9NtwCtRin/6ss0SRsru8BrlDnKGQp3eyaDLycyKIcsHoS
	 DWJCo6bxECUP0NHrpJQjL1/qGA4yXowPMMdQBRWgMJbFH8AbUbX6YxziHiJR3IcyTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLb9YpG7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07C606A32E
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC07C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gLb9YpG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793096978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
	b=gLb9YpG7t7aAG5zdrtnhvrwl+EWJbl8BAas3vnSQvE7RZFC1to4hrFJ2HzYEXlEd7BUFNl
	AQp/dEfFDJW0EhBTKWGntzjWOoRNCmTG3CAPNCoGP2WFDppFPrRHTHwVg7Povykn7MS4Hz
	YOoQJy/9sO9n4UL2QB3b4MknMrzEpLQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-ORIGWGBGPj6J_33amd8MiQ-1; Tue, 27 Oct 2026 06:29:37 -0400
X-MC-Unique: ORIGWGBGPj6J_33amd8MiQ-1
X-Mimecast-MFC-AGG-ID: ORIGWGBGPj6J_33amd8MiQ_1793096976
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfdc0f491so2201340f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 03:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096976; x=1793701776;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h84z7fd1Ik8wN7YTsUmwTZKDWUsWH0q82RExH9eag3k=;
        b=Ji0EwgMr//Xgi6G9h2GwjMeYOp70RQdt/QG+P1/vM0F8hYn+A8Xvw1J/9FCuovTEw2
         sj6It23WbzKvOZ14wTopaCKKZCg5ddD9riqQ/16KwjkGu574POYQcKcshKFGtTaD1YFF
         y+CausWA9nGl6qKbAIKbNFNt94ltGs8kNxd6EuhRyUB8ctqVyk/rvb4qH20gHGbiYi4P
         9xBgrak7siTzxWCAWzMwM5rHzRej8A9ubqiug3pS6BEqFp674ARH8K3YQwXJh+q/RxMR
         WcNERhT7iRqxVTfeQEGjoujLDajhwweWBP0jSHDK1UC/f6sWaEZNmis04CysKjyZx/vi
         +ZAQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ5RH1/0pMKK2Viy8+vn6QS8TiQZhiFgao/VZTj3UBzSHDLone9LV6+Uu0uRMXiFMYrE2yHD+wJj2N@lists.linux.dev
X-Gm-Message-State: AFq9FYKu9gKp2FSXV+EIM4XsyQGbDLTHgxL4YF87KA3mCLw0MIn+/TXL
	PguMGDpywWmmPo0F4uoMRjjwYtHxd2vUAQ8qcwgh5BN8JpA65DtWI/8ZdJK6OWfAcJ3+mosDpDx
	1GlPTAd3zIl/PdpmXZlzv+bY2qAlCkCaNOTR/P14HZAOCoYGPER5tSuc2p5ln55M=
X-Gm-Gg: AYBFou2IMvHizACDbNtEAVMwkgSKyqNUzqFid7RphLtBrqWqAAeiQNs7JEennU7lqqY
	Md7ZW5X1FUiNqFmIwAQIAjLcLfrwfv98PI8pQ49d4UhXCPQg8eFsqc2f/6Kbf7y16WXkM+BeTlZ
	t2vkxpwO1mIKMQqsgBIA2rd1415s1GvK1QjDXRy2S20dlW4f6HIxVa5zvfm+d/zBJ/MsZprxmx9
	T1d3DGmZsUl7OhUb/D4RlcSwKHFPTRl2EZ9CMEb4kLeqpNGeR84gyMN1y9pEpYGo862t7btWN/V
	uNPQboB+m7faLkfwWigxIhJnW9ekxmDYFY/RU+hAxt8i7o5OJV6wWwJexBOZAS1rYAk=
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr175618575e9.22.1793096975894;
        Tue, 27 Oct 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr175617615e9.22.1793096975354;
        Tue, 27 Oct 2026 03:29:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm254068375e9.13.2026.10.27.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:29:34 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:29:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Ard Biesheuvel <ardb@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Alexander Duyck <alexanderduyck@fb.com>,
	virtualization@lists.linux.dev, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sidharth Telang <sidtelang@google.com>,
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Jacky Li <jackyli@google.com>,
	Steve Rutherford <srutherford@google.com>,
	David Skidmore <davidskidmore@google.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
Message-ID: <20261027051245-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027025616.1632690-1-kevinloughlin@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -_56ThqYv5aAbLg12TvCuAq87RC7BT2AylHa5kMazlY_1793096976
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> This series enables virtio-balloon free page reporting and memory balloon
> inflation/deflation in Confidential Computing (CoCo) guests, starting
> with architectural hooks implemented for AMD SEV variants, in order to
> support dynamic CoCo guest resizing.
> 
> Today, memory ballooning and free page reporting are essentially unusable
> in CoCo guests due to three main roadblocks:


For me, the bigger question is not whether we can, but whether we
should. Considerations I would like to see addressed:

Security, e.g.: does knowing which memory is free leak information from
the guest? If no, why not?
Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.

correctness, e.g.:  Linux has init on free (and default on windows), if
initialized pages are dropped and host can not be trusted, they have to be
re-initialized. Is this handled? I don't see it in code.

Also, performance, e.g.: How much does this re-initialization cost?

Management: it was simple with balloon off unconditionally.
Now we are in murkier waters with various features offering
various performance/security tradeoffs.
What if some guests want the tradeoffs but others don't?

Documentation: for all of the above.

-- 
MST

