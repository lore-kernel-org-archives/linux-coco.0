Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C9714A96
	for <linux-coco@lists.linux.dev>; Tue, 14 May 2024 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715663305; cv=none; b=Oe74x8OQO9ozCi2DtFtcCAFNIgiW5dLHuQmtNFMyAdywMohmpENM9+sNmqAvZ+8LHryk1nEk0tUrYV3b1c6B2blm+j7VbfupXGkxEKvnEGH/Jvk9P8jG/UxrDfKkkQNf6FtlTpYjgXJ2ajk3IiIh6RTqXp2An8UqZU4aTBE5ltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715663305; c=relaxed/simple;
	bh=ieIbWlqpi3qncOa+DKFbV5vGmc6SVatErRwe1s69pQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUk/LTwny7+SndXdTq0ZCFB5iZHbvCkLxqQ90hkIo6B7JAhPq0NSw/6Abv1Y1grxrrM9/MELhTg3zCspmxiFCnaM3TRsv9NmB8FqV0EJNmUgVnT9KVMsdKGL4SaR8jFJ8IsCJntGRzDmP8i/hC6GZZoPGR7dQCnHrtZ9mHkoa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZqAEEXmB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZqAEEXmB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so19217175e9.2
        for <linux-coco@lists.linux.dev>; Mon, 13 May 2024 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715663301; x=1716268101; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a19HgSmq/trWYOKDNko6X/3OBusO+lp3rPBD1dWx/PQ=;
        b=ZqAEEXmB6TSRD7aZsSVNNNop+HLMYXoOVKuSGvXTwNQk9ZSYmNdA7DBYTRwrHf9HVE
         75LY4XlDfMDMdDkwfTFlTELft5LMxDkrwveXnn9uZe+keDRg0seg6Ct9cQG52ePXEXJU
         KrYTQMw5lRqs+8rVQJyeqYZIicmKcWxSlJ7smdhnCjFpktwM6NT+wuwCFiI2qhpcQs2X
         3Go6NqbyNo35uFjsdwlqtAVFZ5gJ+Ec3ywF8p/jsGL9f/I9NztTbwQqe9JWGcuXiuFCG
         W/7DKVYaC0diGD70bNBNUw+TgE+3bxbESbYI46nEmn7zF78SrU4bwLneJwyUBcrr/59M
         UkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715663301; x=1716268101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a19HgSmq/trWYOKDNko6X/3OBusO+lp3rPBD1dWx/PQ=;
        b=tnwyvWfTTczqydCGG9+EFlg6jap2Yc1RAVyRdik8lMle4A583I4klnD0AvfyvjwZ8J
         jqGm3PnHNmpn1q4zTFXAnGheDoJYxKYuqpigbojNEGNxKw4D3fPMen2joEsAMSOfg+sR
         Xcso5w1OaHp8Kr+JBksBeUk+PYmD7E1OtU2HdCGT3mx6S5hIBSvSXPVuZrqLQKWmr91S
         S0hXr5fSocTqcSpqDYYQUWhmaeAS61XEFZbW063HCiDmqTaUFZ9dXnZs22XWYOo0I4WY
         alkVVPqyjhVqBrndkniuyI5xffUOnIJ1M6BtkGblwrQzoumZn4YZk9YlZLy8FEKPMl/a
         XuNg==
X-Forwarded-Encrypted: i=1; AJvYcCVgapQBGHx0MrDSY63glGybN9K/d0/ThUiUUNPxpPPMHoaeFKHYG6xh9OD+lhOwhnjVh48h/aFwzsO3gIx3/3W/DYqlmTY838hrSQ==
X-Gm-Message-State: AOJu0YwxgSZb1iPJPxQoL4EX519wifTWSRd1YCOjPTES4Cel36zggeQd
	rrESBcVROeDLU9yQqZuvVxYwY3aRsD4hwwcg5zukWid/3VG24qwnQIUqBwTLsmo=
X-Google-Smtp-Source: AGHT+IGlBf3IWKGC+J9VINEwYnh1B9uENrrXQXg3NIcAKjXjFsRFaHL1ijjFWUAjW3iOtpw9ewXEQw==
X-Received: by 2002:a05:600c:4f12:b0:420:18e9:86d5 with SMTP id 5b1f17b1804b1-42018e98859mr26458475e9.10.1715663301584;
        Mon, 13 May 2024 22:08:21 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87d20488sm213889265e9.25.2024.05.13.22.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 22:08:21 -0700 (PDT)
Date: Tue, 14 May 2024 07:08:17 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Qinkun Bao <qinkun@google.com>,
	"Yao, Jiewen" <jiewen.yao@intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>, biao.lu@intel.com,
	linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 4/4] tsm: Allow for extending and reading
 configured RTMRs
Message-ID: <ZkLxwacH9nt6U9dk@vermeer>
References: <20240128212532.2754325-1-sameo@rivosinc.com>
 <20240128212532.2754325-5-sameo@rivosinc.com>
 <ec7edddcf8c74e48cb392db0789b03243ab05692.camel@HansenPartnership.com>
 <ZkHoiYMseU0XqEbR@vermeer>
 <a8ea533bf30c658508875948f29341663360db57.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8ea533bf30c658508875948f29341663360db57.camel@HansenPartnership.com>

On Mon, May 13, 2024 at 08:03:53AM -0600, James Bottomley wrote:
> On Mon, 2024-05-13 at 12:16 +0200, Samuel Ortiz wrote:
> > > However, it struck me you missed a third option: use the ima log
> > > format.  This has the advantage that we can define additional
> > > events and have them published with a kernel patch (the IMA log
> > > format is defined in the kernel).  Thanks to the TCG, it's also CEL
> > > compatible but doesn't require any sort of TCG blessing of the
> > > events.  Plus we also have existing kernel infrastructure to log to
> > > that format.
> > 
> > That's an interesting idea. It may avoid having to extend the CEL
> > spec with a new Content Type, but otoh the current spec defines which
> > IMA events are supported. So adding new ones may require to also
> > eventually extend the spec. But I guess since IMA is a Linux kernel
> > subsystem, changing the kernel code and ABI would de-facto extend the
> > TCG CEL IMA spec.
> 
> That's what I was assuming since the TCG is currently deferring to IMA
> in that regard.
> 
> > Here I assume you're talking about the IMA_TEMPLATE CEL specified
> > format, which is designed to accomodate for the current kernel IMA
> > log format. The main drawback of this format is that the digest does
> > not include the whole content event, making the CEL content type, the
> > IMA tag name and both lengths (for the content event and the IMA
> > content) untrusted for event log verifiers.
> 
> That's only because IMA doesn't yet have such an event.  If we're
> assuming effectively designing an IMA log format for non repudiation of
> external events, one can be added. 

If we were to follow the IMA_TEMPLATE format as our output RTMR ABI for
the event log, adding one or more IMA events would not change the fact
that the event and content type would not be hashed into the extended
digest. Unless we want to specify a different behaviour for each IMA
event, and then verifiers would have interpret the digest construction
differently depending on the IMA_TEMPLATE nested event type. And that's
not pretty IMHO.

Using the IMA_TLV content type would make that cut cleaner at least. A
digest is built on the whole content event, for all event types. And the
content and event types are trusted, i.e. the verifier can securely map
events to the reported event types.

> Although I wouldn't want to be
> hasty: one of the big problems of all options is that no existing log
> format really covers the measure container use case and we're not
> completely sure what other use cases will arise (the firewall rules
> measurements was one that regulated cloud providers seem to think would
> be important ... and that has a periodic rush of events, but there will
> be others).

Right. A new CEL content type would give us more freedom in that regard,
as it would allow us to define our own event content value in a more
flexible way. Instead of the nested TLV approach that IMA_TLV follows,
having one where the T would be a max length string defining the creator
of the event (a.k.a. the attester), would avoid having to formally
define each and every new event. That's where option #2 in the
presentation was heading to.

Cheers,
Samuel.
> 
