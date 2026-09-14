Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FAA3E5A30
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372112; cv=none; b=ozbDRipF6//ABDmyvfmLZmFCkysuWGlijERn66v4tLnJPAdgXOGGmUwPivH3c54CgapECfYYQdkm2xg/TI+2eoZyMEBx+soZr4iLTvIK9z3Q38mXcWBEbGrftxV+lGSzqewBC5l9cU+G3I+hICrf7KnJCZfyOA9jC7JOL5MpUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372112; c=relaxed/simple;
	bh=wKoOL5nGwvWozMw0aY7lItnriOnICvJoe9c+seOUmB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YHiIq7/emFvaHerIHb06gQwE4DociZlUsyScVrZnFRVpgXMi4BIvWW2SsXADiEQqWDvm+yxS1uIxVzUURgtKAco65BD/yRn3w6Zjc+IEbU0ia8x8qufM9IELxsr5gTRwGsGIkT5L+UA5p5W7gc7A5mCYpOfoPAfV/NPlhs2Q82Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bunCMjrt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bunCMjrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789372109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BijyvVrhoJUaETUvFP/LOF7qCF9MBMWOVmuhNk2So8s=;
	b=bunCMjrtEOh2zIWIANd6mg/uKvAlmAYNX3eZOmJaZzvVvuCuf9CwSOOp9zvmhLKfQ6MYIg
	GTimvLHk+yL/IbEOv2j3hqmZS173c8zGCfeLznWiA8sdlcME+43gdjGihcIDpiD/4JIoBJ
	gUDE3eGARUuy88cg/KqUYn/bkLs8w3k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-MxW1h27lNMueLiIhU7YFtQ-1; Mon, 14 Sep 2026 03:48:28 -0400
X-MC-Unique: MxW1h27lNMueLiIhU7YFtQ-1
X-Mimecast-MFC-AGG-ID: MxW1h27lNMueLiIhU7YFtQ_1789372107
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so11576335e9.2
        for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 00:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372107; x=1789976907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BijyvVrhoJUaETUvFP/LOF7qCF9MBMWOVmuhNk2So8s=;
        b=WP+BBQQNxUbEjJtDTBww4VWA0EoY9sHWvCcn49oDdYsRLtqtHMf/dF6Pi40bfoblyq
         njw/XiVANe29Sj+t37tSUTtep3T2iA+SBlREXXVpMXQBKrW0ORFcsgL+GcQOXfzVfQg3
         Qs9MHRuV+i89zHrEAusFqUHKxvYDVwZkMc86lGgcWiayPtX6YiPFQubZ3Fs7JlDcJrEx
         LsiEXg1BXQ9OSh4rA+iFzVBGpoTFURZKzCMx7vsbT0xpbB324pWNztY08hqYJJFDrQJV
         s3XI7x2xwlAs9fMhOpJ1iuGd/Wy50wNcAcahAKXjulkjxcwJo8ZKvZcHvySfNsMI4fE0
         4mAA==
X-Forwarded-Encrypted: i=1; AKwUvByMOq0pmNelA4qkLQE7DWI7QaEn4+g8XRtcQ9o3HfP5MDjU+zuO3Ysp2IVphOFOg9UYNjaNLNgdrG0T@lists.linux.dev
X-Gm-Message-State: AFuF++kvMRgewW4H7y/Ifa+GoS25svt4fO3YY8cTXr8h4G3x+27Iy2Jx
	1mQDCPxQ+V31FC1P0GolGa+D3kP/riA4ywPpZyyRcjklx1C9V4XMxCeUi7IDzFuBbSntC/TtSSy
	nxuf+dK5KhSwK2IwLUV8VERJMquarcbM5OCLNeaeoahUEUL2+x2+lmKK+Y/49JtE13+7Z0XY=
X-Gm-Gg: AYBFou2CnVEgxuEyrEW+4XDalF2IIFddNtW0mpliST8nrIP5hzPYclaArh3Y+VNQiht
	gTJEQK/sl6f7yyt+xi4X4/J+OMEDHkyVi1et7TkYT2Vt7zeOpTTpXv+cMeVP3+YgQFP2D6lUX9I
	s3orqQgcf3r650OyyB2Sr3Ji1n7YvrdokT6xXUp5IKnSJ6H0syllZFsit7ywGyGsx3gKMnsnLm3
	KnZj0kzNd1wMxjXvtlHWCtWMU+KXgFWl1o+Q7b/9H5lslPfSEt1nSuRpEvxKDWWkKNT/BFa6Kmk
	FeUDJJGKVOi1xAKISvyQRYQSwPif6ndJ67S0Umk3XxZsx2qLIOf86jV430GQxZkHggOkapovB9t
	mwez0yoIJQB3M2m3qDObNtC2ZFXcfpw+yEC8/XDVBSOljSA==
X-Received: by 2002:a05:600c:6309:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e7a67eb3emr27530815e9.10.1789372107210;
        Mon, 14 Sep 2026 00:48:27 -0700 (PDT)
X-Received: by 2002:a05:600c:6309:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e7a67eb3emr27530205e9.10.1789372106622;
        Mon, 14 Sep 2026 00:48:26 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm23908521f8f.34.2026.09.14.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:48:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:48:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM
 cannot be registered
Message-ID: <aqekSpzm14h6fEJr@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com>
 <aqJoJBNEpyKpKKix@sgarzare-redhat>
 <20260912182454.2292590@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260912182454.2292590@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V6DEfRQ2a2HjvztFr2wJYL1m7BZmou72FqC2zirhxpo_1789372107
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Sep 12, 2026 at 11:54:54PM +0530, Gokul K wrote:
>> I'm opposed convert to an error message, but honestly I don't understand
>> which problem we are fixing.

Sorry, of course I meant "I'm NOT opposed to"!

>
>Only an inconsistency: no vTPM returns 0, a failed registration returns
>-ENODEV, both leave sev-guest registered, and nothing reads the return
>value.  The failure itself should not happen in practice and I am not
>arguing otherwise.
>
>Happy to drop this if you would rather keep the -ENODEV.

Up to the maintainers. I'm fine with both, but TBH if SVSM tells us it 
has a TPM device and we can't register the device in the system, 
something is seriously wrong, so returning an error seems fine to me, 
since we were not able to properly configure the SNP platform.

Thanks,
Stefano

