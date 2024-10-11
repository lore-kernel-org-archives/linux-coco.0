Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C692940D
	for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659744; cv=none; b=nQRzZrNuy7DGJ7axdmftM0LahWmkCXgdiLFXrIsNsT7HTyFjoGVrrmUT/wa5t2p5Ifr3+lzIEwK2h51zm3wruTgqojRmmxidQyiEwtyQeX8OXa5hcv2XKnm5kMom4xo8nluGNkQlQpqMVpoAi8OJzz8X12U+OB9iMvqckmIVRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659744; c=relaxed/simple;
	bh=0ird5SSUaLCFpmcf0H3uDs6mag8WxLiTFKAm5TpIph0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tx2kZHxG44QWmLU/8FLcRX55nN7oGAGN8+05lrKs6OOmboJHCMcNOVoK+t7bFrPStJAV2Yicu/kPn0Zs7kMMFjcArLKaOTgllgfZp7TQJnJZSITj5Zxl6eIiFRpgxtoj/jYtHaOqRL/UyTaTGYrIkgfbZuZrlp09EjKBmL0ewa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1qSMUNiC; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1qSMUNiC"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35199eb2bso8440697b3.3
        for <linux-coco@lists.linux.dev>; Fri, 11 Oct 2024 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728659741; x=1729264541; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yD8fLJDMIKEGL9LdS26hHvshcG+d1j7neE9mXfOfORQ=;
        b=1qSMUNiC5HBUsvhkIZgIJEsf2EwwPxworTzNQJL9i+4BRNVwU7zEzw0hKW2Pi5FUG1
         5mjXVAiErlwQuJsNKTq4ZBQhWRVv2YiT0DN0awKHPcCpu/mu4P1KEvt/WbFTniu70hdt
         EmJFXlCRDRo6SqLWsd98pNaWDV43nKtLJYONITKFSIukP1xDAmgY9Ui0Y/v5ZBwtytU7
         e2H+JSh+j3bs5Znyz/gWUkqV12WD7dPxYcJCGDIJa8paDMFyDRqaTbUYim2xX5/KEROs
         p7zVmGA2sTj6d+AoF0D/1doo6ZljyEHcjXX/iS+On6csKPLDlm+aJlEvpVAADcuzINZA
         cxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659741; x=1729264541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD8fLJDMIKEGL9LdS26hHvshcG+d1j7neE9mXfOfORQ=;
        b=v6uvQ5kPBDGfD3JvaH/hxz1hgw6Wwoh68S4M4d5McmezG9f8+m1figuPi/MbBTpuaG
         uGOW9daVVXZsOTT+YzdLssioTcVsK7UBuT+YrlSnmL80iAZP/BJT5/hr/Ez38l9uy3Cm
         80Y8SL3RoFfWLR8W89AX0gzMhQTm3A1WNADenuPVhX5mkyUFCF32gygulU4WJfHbLBQV
         vLlJ+rI30D5HAgG8PgW/VVwlsXKfhAWgqVhxD5ZhKk0A89COtZrQW3hzIJToKYIXOrJp
         I0TyFfBDdfRmjTOC73rz5j/C8Se3bzdTvjexEyUHbbxUvo7jU1g5mO3t9X3FhHW3GaSf
         HE9g==
X-Forwarded-Encrypted: i=1; AJvYcCVTwWPntfKj3fTlKSiStjJoFs0z98d+fUugmpIuu08xLOG5ykmNE2Co3X952eA5tEu9QXLUr4Cb4/gc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3z30kzETH32MLzOat+kfCaDRRcZAo6ZTQHMWUMSLjXHVfIKHP
	tefDHcOk68pHeTLRfZ99ocpeNDFfJwhCm3/h7oPPCq7BJqw3inxKUH9ASsWELuQ1CQZDMakMeGl
	7sg==
X-Google-Smtp-Source: AGHT+IHcJiD6aNAzPZbyQ0X6W/CQXqg5RExz1ZOW/RVcZQ9RjOja9gvFQTsg5ZX8TQuQ7LSYdG7H3he9psU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:86d0:0:b0:e25:5cb1:77cd with SMTP id
 3f1490d57ef6-e291a32d32cmr11193276.10.1728659741554; Fri, 11 Oct 2024
 08:15:41 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:15:40 -0700
In-Reply-To: <d54f9b64-fc9f-4b63-8212-7d59e5d5a54d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <diqzy12vswvr.fsf@ackerleytng-ctop.c.googlers.com> <d54f9b64-fc9f-4b63-8212-7d59e5d5a54d@redhat.com>
Message-ID: <ZwlA7oi4WQWi6bXB@google.com>
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 11, 2024, David Hildenbrand wrote:
> On 10.10.24 19:14, Ackerley Tng wrote:
> > David Hildenbrand <david@redhat.com> writes:
> > 
> > > Ahoihoi,
> > > 
> > > while talking to a bunch of folks at LPC about guest_memfd, it was
> > > raised that there isn't really a place for people to discuss the
> > > development of guest_memfd on a regular basis.
> > > 
> > > There is a KVM upstream call, but guest_memfd is on its way of not being
> > > guest_memfd specific ("library") and there is the bi-weekly MM alignment
> > > call, but we're not going to hijack that meeting completely + a lot of
> > > guest_memfd stuff doesn't need all the MM experts ;)
> > > 
> > > So my proposal would be to have a bi-weekly meeting, to discuss ongoing
> > > development of guest_memfd, in particular:
> > > 
> > > (1) Organize development: (do we need 3 different implementation
> > >       of mmap() support ? ;) )
> > > (2) Discuss current progress and challenges
> > > (3) Cover future ideas and directions
> > > (4) Whatever else makes sense
> > > 
> > > Topic-wise it's relatively clear: guest_memfd extensions were one of the
> > > hot topics at LPC ;)
> > > 
> > > I would suggest every second Thursdays from 9:00 - 10:00am PDT (GMT-7),
> > > starting Thursday next week (2024-10-17).
> > 
> > This time works for me as well, thank you!
> > 
> > > 
> > > We would be using Google Meet.
> > 
> > Thanks too! Shall we use http://meet.google.com/wxp-wtju-jzw ?
> 
> I assume that room cannot be joined when you are not around (e.g., using it
> right now makes me "Ask to join"). Can that be changed?

Yeah, it can be changed.  I did it for the PUCK Meet, but I forget the exact steps :-)

> Otherwise, I think I can provide a room (Red Hat is using Google Mail/Meet
> etc.)
> 
> Thanks!
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
