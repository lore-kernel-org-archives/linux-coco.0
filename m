Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8534C98C
	for <linux-coco@lists.linux.dev>; Tue,  7 Apr 2026 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546342; cv=none; b=RPZSKUTER/pZ/DcngWmb510KvXkN4TWI3C78NIr7a8rrTW+olnodr96UGJphd5mbLR/vEaVy/vPfS9yncbdab61fIUSJg2Iypy89Q9mf9OXAr1LbI3f0QfmJy9cw+om+WiY7BSD6+fIRHmRgBkV/5KhqakojDX5Gg+zcpFV+FMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546342; c=relaxed/simple;
	bh=oK66n8s+O/hYsgxUx+3OljUGmEFfW+ZrHSNTkfOI6FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alx9qb1sNEbq+CJbajpW3YEEpg4hH/ga2NRya2nBp2U6NODCqZRIeONuvrQmbnVYNfo+d15iNOsniNdLFOcQwKprspgEW/LkzOpdw1zy8W98bUcl1l5nev68zIAxfRhB0IVHT3kk3iIyuIOR74AwWojMuTOIjJy4ltvSohCMPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WX25gQz9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WX25gQz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775546339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mljjuQYWVEJA5/gTJORfrhvkCXmvQyM1a+kpTpApJBc=;
	b=WX25gQz94MPVagvbyPJNHoKCx6QyoUnuLKWriBrj136itDYbwLJSqQjktI0dl20SpyA8AR
	Th+1sImBLnHJEC4nIdBQOmnaS6qRKyteiHEE9gu90ToDelSStfUTAQApBobzlx+N2CAu7p
	NSnDtbcWwQvlNrWVcLgTRBZUuFxi/DU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-z6FHlqXqM3uLgl1AwNp2Jw-1; Tue, 07 Apr 2026 03:18:58 -0400
X-MC-Unique: z6FHlqXqM3uLgl1AwNp2Jw-1
X-Mimecast-MFC-AGG-ID: z6FHlqXqM3uLgl1AwNp2Jw_1775546337
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43b99add7f3so3086995f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 07 Apr 2026 00:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546337; x=1776151137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mljjuQYWVEJA5/gTJORfrhvkCXmvQyM1a+kpTpApJBc=;
        b=ZhQClWGqPuT5J3WJ5t6Can4L6S40X+T5THoKzL/5OnwVXAm7XECHnvydJwdAc8vzul
         GbXTnmOyNPhgXZe74dETKNAvTuiChH88Z0KKaiWnVsTi0NVwmSqDHFACY42u+LYPvTVx
         mOPweE1R7fYzx3XHJ2YvzFRyY2d9IGUc4g/OXUVFcMj88byv+meBHc6muA/0nQsBlOzl
         ihqRbtxqdqyt2wvD/Qo0BjA4ClbFhjHT5kWn6GUFHS//nZUssVTTG/R2eTDF53zzfntT
         zqPtknH7N4IGIrNVRgfVWwBtWawm7uAE6S94Ig4+9Rg5SIycCgaiI7R0eSTzMTuKG2bj
         kfYA==
X-Forwarded-Encrypted: i=1; AJvYcCVxG+wInJPjEls80uM1eAcSrLuNDYkYlkx9wDV4/prOjIa88giSc5yzXIQ+RqCaNK8QKMGAfUmiQWuI@lists.linux.dev
X-Gm-Message-State: AOJu0YxmjYkzm3kJKtuzShLN4w6/ZrsYx6Em2rmmWt4I6DtzbjnE/9qL
	1HofrBIeDD2SFkb6f+mztoDxTLndZr8LLV0n/ndVcdSpORMjdHP74XWTKQww1ygQqcI05AKT/Pj
	7P6atrjCoc6JKmfNBi/iJxY0j49UEGVYYNZuofGmF3+gtaDWXt0S7lSp+9nN06wwtTdnePZZgsL
	pezHtOYFK0XOaoahridG2vNT08409werSaI481HQ==
X-Gm-Gg: AeBDietB8NERlVPQJiGm8oo0w7R5atLdre6Z9Z0bwX6+XK5xeZQWvxEdp2rnpWH2PYq
	W7dQuo3JCVC8Ozp6zCILD7UGfshk1rTNeZ5IJ8cFgZGiX2a7R5S9+CIYtoSfo/rDDoGBVic4i2y
	SbMiWS7EPPV+2xhHbPNRctp/ma2OHueaSpge9KBJm5hTfiaL3sTM15LimpBAIB36T7Ib2Z2Avfq
	U5UOiRhhNtDv3dOsac2wviG0aK83xibRTttRKkRL23lB179lRb/KoNvHByzj4RX8+YxAH0xGTXu
	h7hX
X-Received: by 2002:a05:6000:2886:b0:43c:fc5c:aa08 with SMTP id ffacd0b85a97d-43d28f95b8emr23587399f8f.8.1775546337116;
        Tue, 07 Apr 2026 00:18:57 -0700 (PDT)
X-Received: by 2002:a05:6000:2886:b0:43c:fc5c:aa08 with SMTP id
 ffacd0b85a97d-43d28f95b8emr23587346f8f.8.1775546336701; Tue, 07 Apr 2026
 00:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311003346.2626238-1-seanjc@google.com> <7ec084f8-812e-42f2-8470-e416fa7ee848@redhat.com>
 <ac75iuf9gHIhvm9u@google.com> <88e9d7f0-35b8-4559-9f4d-c7daf1af6012@redhat.com>
 <aea176c8-35de-4042-bf98-e42ce05f93fb@intel.com> <CABgObfY05NU8DS82jkwpF89_p1nR7VJ30HBq_xaMg_u+-j=0Cw@mail.gmail.com>
 <adPRA4ZhnvbaXSn0@google.com> <CABgObfbLm3FR4f_nv5EyYJx4jwfeBaVgTLhr7P++hmhCP98e3Q@mail.gmail.com>
 <adQs4LQgy3mS2t89@google.com>
In-Reply-To: <adQs4LQgy3mS2t89@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Apr 2026 09:18:43 +0200
X-Gm-Features: AQROBzBFAoXmOuQaya9SW3dphnVY0dfdZmgdgdkvSsxEIlf_53nmfMraq_tgj-4
Message-ID: <CABgObfaFqrSENS=_eNgkyxebqL1vFauNqG3XAgZm0EHfkbQ_gw@mail.gmail.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
To: Sean Christopherson <seanjc@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, Kiryl Shutsemau <kas@kernel.org>, kvm <kvm@vger.kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, linux-coco@lists.linux.dev, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 16AweblQQc7iZa1UeSDQMwSWeEYo6eKTYUsuBa1TKf4_1775546337
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Il mar 7 apr 2026, 00:00 Sean Christopherson <seanjc@google.com> ha scritto:
>
> > > .  So unless I'm missing something (or hardware is flawed and lets the
> > > guest speculative consume R16-R31, which would be sad), it's perfectly safe to
> > > run the guest with host state in R16-R31.
> > >
> > > That would avoid pointlessly context switching 16 registers when APX is not being
> > > used by the guest, and would avoid having to write XCR0 in the fastpath.
> >
> > For now yes, but once/if the kernel starts using the registers there's
> > no way out of writing XCR0 for APX-disabled guests in the fast path.
>
> Why's that?  So long as KVM uses vcpu->arch.regs[R16-R31] as the source of truth
> when emulating anything, there's no danger of taking a #UD in the host due to
> accessing R16-R31 with XCR0.APX=0.

Yes I agree with that. But the unavoidable part is the XSETBV because
only the assembly code can run with XCR0.APX=0. As soon as you go back
to C, including during the fast path, you have to ensure XCR0.APX=1
again if the kernel is compiled with -mapxf.

For now, I agree that early_xcr0 isn't needed and you can run all the
time with XCR0.APX=0.

Paolo

