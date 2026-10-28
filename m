Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213672;
	b=G8lYz4ErlT/rbaMmKoO/aBMOe8VnRsGvOos8tmGDULz6wwyRLVisCe5i2ZvDMvDZZmCz
	 tzUR5gVuNfI+oiXwKXtg5LXJiy4mw8ZBebXz+Z7bQaWr+eqwlyt1eN/RJFfKMyohEuuZu
	 YLZGJrNijhI51f80KbK738og8EmoaUGl6DFsGfYefndRHuHiy5pzbdkTed/5LbATNA49f
	 Qqks/pciZQyRc3fqaU2FweiCyTZRxLdMfKoyA1jvuUADFBKsuNpkIYsk03/VRmvA+XEV/
	 1C5rSfjrsxIi88pDPRbBZkYt4HbjCIr1aw1kqIfCd/ZGQFUdhzwjBY6v130ewz6nhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213672;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
	b=gTQNbomT0fxFh62A4+62XXdbFK8QLUkgwxam1/Bcjni1eC5Gafi5tI0KC4FIUQllzC+c
	 ReQk3I8IuaHgd5WigRZ9fk6apP9S2PwxXyvIgZ3sG6FnqFWS/oF7PJBlx3MMarf5yy8Vm
	 uEaivQi6o3PYstywUI/KPBuWZZaHevQNYQoNavruEENdnjDkwYVua1/LELy7NQxLsIQ9i
	 WAve52s1pabcFnJ2D+uG0L+FkV8RpSDW/2A0cW7FSMwzdLDjy0NAnR5smpUZvM++1+QpP
	 8kF8mn7hwWagX2DSKCzC4Gabx1BXR5iG6+J1YvxDxGviWnQpLyZAIVEpZEYCGLc3FdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="EuckRQh/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56976606A320
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56976606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EuckRQh/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793213670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
	b=EuckRQh/vX6Rv2EuSqujU8lJJun/SUkyC6Qh2rfoMQq3qPnfosec12pC5sb9lOs6qL/1qb
	nURwjjkqi1dJXpO5J3uLIGX+eHQ8vyeEtnWlhf+2brDDz47cEGzPozrj9HgceiAn4IsQVI
	HEg3b9bnoEiE9os7FNiO/SgQk1ACvCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-MJB4PQxhP7a4X048ui4CSA-1; Wed, 28 Oct 2026 14:54:28 -0400
X-MC-Unique: MJB4PQxhP7a4X048ui4CSA-1
X-Mimecast-MFC-AGG-ID: MJB4PQxhP7a4X048ui4CSA_1793213667
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso6611045e9.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 11:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213667; x=1793818467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vc/BwRMumh6GCDfZk9HEhgcPOmsWkZc9E+U0h5Wqek=;
        b=jgsGTjeN+BlI7bv5XQSF1ohRL9H7Hnbp29Dg/BpkWMDdEfVY2ylpYX/LJVIdsd2TIX
         yQRgQ/zfHOsI/bKQ88zZlZMXlBVNrkf4eaUPS413QOLYrCU0T0Hzn5bDsT0TV4C/wu++
         uRLXb3Cnpv+Jt+hFHaEQ3e5WqJsVHSwuFyuumB+8eK/BjuXg5yY/+YVapeqi6ML0vYe/
         d0eHU2Y0w+XdwBY5Z6W3p0Dg1uHgJpfa1YeOIRZjClRRqWvXIjrVxqgX6hvV6sKDsC1g
         2sADBQSjetBMeEMcRTqwtSrDbsY3VASBn6Vm6H8w1Si7qnZ/i+08YY+AZCXnxwZGvR/z
         xdTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWTMNSvzHjnUX4FGlnup0u9YmENqaSS1YP1+PDwzwl2zpFdYcvnZ65SOenLJe8mk1GnxZFAgqqsFv5@lists.linux.dev
X-Gm-Message-State: AFq9FYKo81KFNxKDJZu7nXDwIO400nFBznsy1p6ISQO0/t2eLwqm/aXK
	ijSLenl5YFKlUNWIBZhmnvcq7SNHWs41KgpWnSxh6Ud+HsMSC6H0cr1r+foBitwV8EHPInXVB5T
	DqQxocGTPiSDQeftJs12ZHn/ZObu70oJdqKM3jt57Yop1nhwtQNtWbPKhEQ8s4QA=
X-Gm-Gg: AYBFou1EEJCtH3cMLALLm+kTlrUFjclTtLf+9do6jeGyy5n5ixMGgMLfhLfN+VuvmHX
	IanbhGxxA5rJWr9bSl6eeMOh6cUdbwrtR7TliEee9Q9XtNzL33SRpJzaLXFgaI8Ys+9dqJp0b5y
	iZewnhTac1eii8B6N2rlLV02iQNakn38rgfSmLAFfkGT4fO0AWblTfwDLRWfgvkaYRyZ2EANPGj
	Fj9bC1HbiJ9vEXT319YoRK0Qby0ntkdYOFLKvd83cdSdanoMQjNFaPPEUKlRhIdSd3xaRnEFlUt
	hJk5nkdy39+TcVOHIwpbvQNjGe3apwl6pCFop2wRNxquglimGCg6nS2jiypCc6bjUF/9frIELk5
	0MQ1pwFJKHGxkHclIbG3k+fOBvqoFBFNjVS7oC7Yl
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr73578545e9.35.1793213667415;
        Wed, 28 Oct 2026 11:54:27 -0700 (PDT)
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr73577935e9.35.1793213666877;
        Wed, 28 Oct 2026 11:54:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm10398775e9.4.2026.10.28.11.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:54:26 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:54:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
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
Message-ID: <20261028145316-mutt-send-email-mst@kernel.org>
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <279a92da-772c-422b-8047-ad37dbae211f@kernel.org>
 <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZB7vurHrsmokiBzF04PJFz29xdr32e19et7A7zDtv7w_1793213667
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 11:12:47AM -0700, Kevin Loughlin wrote:
> On Wed, Oct 28, 2026 at 2:01 AM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 10/27/26 03:56, Kevin Loughlin wrote:
> > >
> > [...]
> >
> > >  mm/page_alloc.c                               | 248 ++++++++++++-----
> >
> > This diff stat should give you a good indication why this series is not acceptable.
> 
> Got it. I will keep that in mind going forward, especially if I end up
> attempting a v2 that simplifies things.
> 
> On that note, I believe the majority of the bloat in mm/page_alloc.c
> comes from...
> 1. supporting the legacy inflate/deflate option
> 2. introducing support for various page sizes to be unaccepted
> 
> (1) I can get rid of by dropping the inflate/deflate option, which I
> think makes sense given free page reporting should be sufficient to
> enable dynamic guest downsizing in cooperative scenarios.
> 
> (2) becomes simpler in part just by doing (1). For further
> simplification, we could potentially restrict free page reporting for
> CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
> any order 2 MB and up. There's a trade-off here for reporting
> effectiveness under fragmentation, but perhaps support for 4 MB only
> (and its relative simplicity) could be acceptable? Especially since we
> would then maintain the invariant that all pages on the unaccepted
> list are MAX_PAGE_ORDER?

I'm not sure what is meant here.
But if a lot of memory is free and it gets merged beyond MAX_PAGE_ORDER
and then it's not reported, that's counterintuitive.

> If I can sufficiently simplify the changes (especially in mm/), do you
> potentially see a path forward purely for the free page reporting
> aspect of this (dropping inflate/deflate)?
> 
> Thank you for taking the time to review, David!

