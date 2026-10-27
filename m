Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133573;
	b=N+Bjq3nOYJ3/HdhwwpGJO3hKCUY6nIUYawbdxlK9ukzemLiDDXErl59VFv4Co+kfC31M
	 0E6Qs0atTQJnZGCiqkq4aUKhAt69WsxaJkeLSyYq7IUUlHfB+sjRiTdy8UfOP7G7YskCW
	 1C3SjENjUas4X9MQ+mcIOoYwO1Lej3cGya576RVSY7YIO2rT4gyxleteKe0m2nvVsANNz
	 UY15i8AilBIJxuayoeT6AdUHvPkiWz46UM+g85z7G2x6n7zkghZctTZLZyUXSAVTvXHvR
	 IWcsEI0PcdMHe251sjQEL/dIp/l1prx9ZxrW5DBdcEZoFg+lddmGj9KddI76qV0T0XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133573;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
	b=LcquuMVqNUgwMwHgNS6eMOrXLFoM5Du2ci/igNURnT0sr+5RHAYTjzHoTB3X0iO8nlHb
	 hvfbranPlFq45BIFRGehPoKefgrRjB1KHAKiSaQG5wxrcHS7lNOxfF3WkiRcWFFoQAYHy
	 q67cfzI4eCXowJKwp2Tjfus3Y1UkHKEF+y8hk52fUMFOVwmYb05e9JPFhUgeT8pQoOsuM
	 lcAibcMcL1aO7HQGIgwfKi+sCJdnj8D5fgnygnZLxFbjQJEn6ljIW2RKzVgvYvgCo8X8D
	 U5YGiq5/hodEPZox/Iwo6F5skpC+diFSaqkDD76x6yQIbsSh3MIC9tEEvavhTDXGaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=akK1+Pw6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A2606A31E
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 20:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=akK1+Pw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793133571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
	b=akK1+Pw6QAhpkcxtlACExkkdPBQa023n24AZ7US++Mz705Iu3vo+9YZJZPKDWtQNE98RpT
	4mhHalLOuPoBzFxX0fsOK0RJr1ZFmQmYctf9yuxGMPltIChuWxw0KoapX9NRCDVqsSkpe/
	B+g+McnWvhefWkzsq9iounxCS9miPkw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-6VMZZ6JCN1mD1rx64vuewQ-1; Tue, 27 Oct 2026 16:39:30 -0400
X-MC-Unique: 6VMZZ6JCN1mD1rx64vuewQ-1
X-Mimecast-MFC-AGG-ID: 6VMZZ6JCN1mD1rx64vuewQ_1793133569
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dea677afcso132411f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 13:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133569; x=1793738369;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roOwYu0f5KwBgODRuBr3gTl9MLGpmNzor9SYb28//4o=;
        b=gOaWtQCIhIE/vpf8FJqb43HjJamnUsEusSTIaACSi3Lq4feePzN6o0svXKwJllQ8TV
         55zwc1u4XaNy5dYjP3BfJLwECvgP7/tjR94YaHpd1ysoCQLZLuCs8KH3LM35QAg3Ii2D
         oz/xaUtHHo74HziUCmWFS5/g3PWGHx75KoGCtuBuYEYqRCvEZw6p7Kww4/m5NbjUO0GB
         0viIhl50fq8o3r15FOXbIY1u1nDVNHnL6ptBFJGUOEVJr6Plu6y788MZWaFPICTXh5Nz
         M+Yl2iZIzzyeaAVy5srJ5B3Fm9+/e6tYmIKjERS36Oy+MsZnLXkUc88cKffrLiDv+6cU
         XRvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpKu4jTpaLNUQulPxDs4azoDzRUBqfT6br3oW+JYaquzIkLW+LVxOJJ2Y7QxCTPYeG9enDiKUty+M7@lists.linux.dev
X-Gm-Message-State: AFq9FYIzytNncGWTXWESMqSXhw7H648TvJWavpAiD5As2//KXHDX84y0
	HWmsDXxhjatkMMkaM/IKtak4Q9VJh4SKYn+WDkzrUOCBMrG+iW7GN9Y1AOHDFa9CR+o6GXq1iMZ
	WH7VRm4ka+kvkb+A9a7oGDkAA6yvGJ9SCKeGrRty4Gg8lv3MoTdr4X7krAWABceQ=
X-Gm-Gg: AYBFou1sojiy67ue6WpG1WyvqANN1izk/K/eNYVyCeiQkMYNvj9fz7rz5Rv7fuGwF2h
	4/LeVNK1/gXWK09eBmglOMKFe0+fqHxmHXpejy6C4uwigy80oeqqYTdp0ud7sknM+EIfo84YY/3
	56gtAckJq8mGHCBjxZCiSHV5/VZdKhkPG4JLsbYi9nELnqw2qmXpq6M8AdQGK6RjJ/+lDINp5x5
	q+ZmOK5HKnl0gRw0PYflozjJqcLYZZkGqNTZWafrMBD0S9pl6Wwf+CwM2fmEECpaFHW0+bqqqx8
	Va0hruTcYWkB8/UCFmr5WzHcOKohiUZfydUyQMVyx/ToGGQFQGQsuexWDgw/TYXqfEk=
X-Received: by 2002:a05:6000:60f:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e5d28705fmr1693089f8f.1.1793133568586;
        Tue, 27 Oct 2026 13:39:28 -0700 (PDT)
X-Received: by 2002:a05:6000:60f:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e5d28705fmr1693005f8f.1.1793133567964;
        Tue, 27 Oct 2026 13:39:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm24553225f8f.53.2026.10.27.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:39:24 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:39:18 -0400
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
Message-ID: <20261027163814-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027051245-mutt-send-email-mst@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261027051245-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UouH1lCyKXlEsf4QXaTV3y0Eb_Uv-SDmHthGWwxJm-I_1793133569
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 06:29:35AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> > This series enables virtio-balloon free page reporting and memory balloon
> > inflation/deflation in Confidential Computing (CoCo) guests, starting
> > with architectural hooks implemented for AMD SEV variants, in order to
> > support dynamic CoCo guest resizing.
> > 
> > Today, memory ballooning and free page reporting are essentially unusable
> > in CoCo guests due to three main roadblocks:
> 
> 
> For me, the bigger question is not whether we can, but whether we
> should. Considerations I would like to see addressed:
> 
> Security, e.g.: does knowing which memory is free leak information from
> the guest? If no, why not?
> Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.
> 
> correctness, e.g.:  Linux has init on free (and default on windows), if
> initialized pages are dropped and host can not be trusted, they have to be
> re-initialized. Is this handled? I don't see it in code.
> 
> Also, performance, e.g.: How much does this re-initialization cost?
> 
> Management: it was simple with balloon off unconditionally.
> Now we are in murkier waters with various features offering
> various performance/security tradeoffs.
> What if some guests want the tradeoffs but others don't?
> 
> Documentation: for all of the above.
> 
> -- 
> MST

And to give this a bit more perspective, I present:

commit ab676b7d6fbf4b294bf198fb27ade5b0e865c7ce
Author: Kiryl Shutsemau <kas@kernel.org>
Date:   Mon Mar 9 23:11:12 2015 +0200

    pagemap: do not leak physical addresses to non-privileged userspace
    
    As pointed by recent post[1] on exploiting DRAM physical imperfection,
    /proc/PID/pagemap exposes sensitive information which can be used to do
    attacks.
    
    This disallows anybody without CAP_SYS_ADMIN to read the pagemap.
    
    [1] http://googleprojectzero.blogspot.com/2015/03/exploiting-dram-rowhammer-bug-to-gain.html
    
    [ Eventually we might want to do anything more finegrained, but for now
      this is the simple model.   - Linus ]
    
    Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
    Acked-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
    Acked-by: Andy Lutomirski <luto@amacapital.net>
    Cc: Pavel Emelyanov <xemul@parallels.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Mark Seaborn <mseaborn@chromium.org>
    Cc: stable@vger.kernel.org
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


Leaking phys addresses to unpriveleged entities might not be wise.

-- 
MST

