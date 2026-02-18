Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7983346A7
	for <linux-coco@lists.linux.dev>; Wed, 18 Feb 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771424953; cv=none; b=O7oFQb0MfUpnPqUUG0cXCZMNb3n4V3cvE275kxRMAO8i04isGhB0iC9/vJhYmDrQ8Gob4jslF+VYv9ZYD9OLUvusYZFcBGiCRRa4WweWcJDMUuDmzamhx7kkONxvclSFs4Mamu05Q+89irijp+hXmPq/wV55uRKHQDEmkDCr7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771424953; c=relaxed/simple;
	bh=IRBQndA03HmhOZxNpi9Cu1G1MHrDVhLuavMjYLrYIZU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m3obXIJfa+moZRPbsCZbVx42BkyC9hkdMvGV89sJVIZg6ncpe7h9l727BbNUTKWWX0syqLjeRt3t0yr340yi/2SNt1DBncMBt2x5mhSsT5otVTNoDmtgBUW/i4LO9TnVEjGYADqGV3S7fDykEbmF1bh8kZ9aLEuAywrKAqes1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpKHIvss; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpKHIvss"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a92a3f5de9so37336675ad.2
        for <linux-coco@lists.linux.dev>; Wed, 18 Feb 2026 06:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771424952; x=1772029752; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJeuFVbekGNTo9ZbL6yrJVWhF0vC+VBsyIOWnUV0wG4=;
        b=UpKHIvssWfj0dt6fKZmB4ZBDfvAP/4l86+vVqr9P2e357/lOyqp7y++dOD8TsUsIeg
         BnGITFBnEFJaDY1Pj98qtoITib5wNBqKSZwLw37DJk/ZogUh+0Oxlv8bKHctx2KxN5MO
         qtWWysBmg0YQt7QIO/+65qPWVaSlMxzvvJLTVZ+H2bNCsvAMwJLoQxrOmhbkycwcmYJC
         dz/DjnbS+ZyDao3t401mxODiLE++G8mDuKpOEUD5U4dQuqQ9eLESl2yBSrkkzy2gaf9L
         cdvLYX89sDdPm+8Y5XAhtNNTT+WIlWeQ8sFXwFRNrtBk44eQOTlP2Aap6xZtHPrBbz9s
         i1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771424952; x=1772029752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJeuFVbekGNTo9ZbL6yrJVWhF0vC+VBsyIOWnUV0wG4=;
        b=EpT6bH2bXbZST/dMdtRGHc9kvUr06toNl/E4rEMtzWm2PWev82kgBP4mHDvoG5q6SG
         Jj8Gh0rY0VFCi/AoR1wKt4z7DFY1CBa5Iw0EpYBSFDsd1rawf51l/yT1Nq45IfTPpHUr
         cjdWDpR7h3fZjk2VseKGDp0VLx7JJEZdiY22emoLBYwje+jIZqIoRpn0DwPJPDG72hSk
         aIijLlFBAe3fArouNfOwERlo1HLA9FwfyAuprhFpPiMoFhvx9w1bnuaRrqFBbvvSZePm
         uUPdUo4y1hANTBAjMtU0hGG7Km1mWkHdpC7uEBEgpsWSEq/CkBtrEAGFzZF8N/7lwDtC
         8jaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwjYOcz1slnld8bqYQTg7m6vVXkSudbwmS6t80Kvf1VYBePkcoTVDJelQ4jLD9NEyBpI0KtBwM2qXR@lists.linux.dev
X-Gm-Message-State: AOJu0YwYMb+3jshNM/x2TXcvK086IVx+CjLEmcr6lu1TMVzGcMwf6QDL
	pf2D1JV3q9Z9vwY8ijh1G84LS6D5wOGQ9ZmAdamJURHpp8WRF213SnRyUqF+HmZQh8IiSGqh0Ql
	cG+9EeA==
X-Received: from plch7.prod.google.com ([2002:a17:902:f2c7:b0:2aa:d7bd:1139])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f685:b0:2a9:602c:159
 with SMTP id d9443c01a7336-2ad50ebb14cmr20825435ad.19.1771424951473; Wed, 18
 Feb 2026 06:29:11 -0800 (PST)
Date: Wed, 18 Feb 2026 06:29:10 -0800
In-Reply-To: <330ed8d57ee5c7574d7bc1b637598bbef5325ee4.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260218082133.400602-1-jgross@suse.com> <20260218082133.400602-5-jgross@suse.com>
 <330ed8d57ee5c7574d7bc1b637598bbef5325ee4.camel@intel.com>
Message-ID: <aZXMkWRuVE_efHUW@google.com>
Subject: Re: [PATCH v3 04/16] KVM: x86: Remove the KVM private read_msr() function
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "jgross@suse.com" <jgross@suse.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"bp@alien8.de" <bp@alien8.de>, "kas@kernel.org" <kas@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 18, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-02-18 at 09:21 +0100, Juergen Gross wrote:
> > Instead of having a KVM private read_msr() function, just use
> > rdmsrq().
> 
> Might be nice to include a little bit more on the "why", but the patch
> is pretty simple.

Eh, the why is basically "KVM is old and crusty".  I'm a-ok without a history
lesson on how we got here :-)

> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> 
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Acked-by: Sean Christopherson <seanjc@google.com>
