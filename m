Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E11C9B82
	for <linux-coco@lists.linux.dev>; Mon, 21 Oct 2024 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729540301; cv=none; b=ici6u45QSfPLhUegH0vm0+i14Q/URvU2ADOP+7K+KMc/FJUTt3CNbVOWjod5i4yt65ySwF5KDQW5tj+cMpgBDjKWIRZVF6zQi0nNB/4WAPBtLM0mhLf75X5gjk0SsoHu0sfqlUVYXvyFpnXJ1NiHyFKLt7c86/wtwBaoHvw33WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729540301; c=relaxed/simple;
	bh=cgF9qdTCV/RUJM1XhvuKTTekZ0x9M+flwDP2OJ+Mxn0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BtNZYRuzjtDZXLiBffYgqJolIiPt6IDlb8Ze2kzabPi/txA2zjWo9pQ2a02YzeV9h+vgc48zUgdjq0oxeZj3RCVR1O7BHLOgotzB00DuV8CcmD/V3Ld4Dibea6XefE07gDGG2jYYXfdTwYhnOwgWto0eFa6OFYJeZYPIyBkknWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P+rOpM2Q; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P+rOpM2Q"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e35a643200so99804297b3.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Oct 2024 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729540299; x=1730145099; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDT9K1Zk/eR3fGoO0hal0kEeCs6xtYajmWI5rS4tNgs=;
        b=P+rOpM2QdH4+jo7a/2DKuvE0opBmefLPsVNHrQGFPfQVSLobvFNwe3e7gkVRq6P3DF
         +9PqHXU9cAplLNFe+1fuGBsgDfPp9en/7aiFfbxmUF5fefamXdFz/eIBgY+9aR5ScJ3w
         eUnh98JT3zntabsKiknFzPzJiWDHMGDQ9YckG3Y7Xx3rawGV+q5zJErkesm6xM1xdGI4
         4QWneJbgD20XcVptPJsv9IA0xLNEaQQW20487ZlImJDLCpV0A9+ZyuSsXgEcXYX1n8aG
         oNi7FGDQw2d29Om7vFeHPR5HGx57gTj3PGSi5QqCobqpV3jRZeSSGe3LyuBCFlzaWZAK
         /2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729540299; x=1730145099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDT9K1Zk/eR3fGoO0hal0kEeCs6xtYajmWI5rS4tNgs=;
        b=MC8PDtGdy3MmiqGIUIYC9maJwEjR96EknxEt22K0aXIwmMLUuPnj7dlJwI6cC4MvLw
         UBpb/LYIdVy2PfPpI9xJKQXrrqdZQI5sEg0Ff5i0AU+pdCMGs5QcSJX7u6+s4t3aVzNJ
         r1QvR9x6j68tXUPNM4xHWFXI+1voZCBtl/OWw0h6vxGym3Iy69Es7ZkK4/4ucbMlRgsW
         rD8tgGrc4Yo2eoh4IvwjcmSS7E4y88eX3dsQhCmDiercklE1b9edhd5em8JO0GTevyFG
         GYNJg1WFzavodDJ6/X6TVyNFzd8qRmBLOwR/DQWpsD66rJ9II71tC+8golmcU8Kd4W9f
         sWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFqWE4/tgrjCKeZTfZD6CX90zw4v7scAxcZ+gJrvnpTPBpOVGSdvQU6feIVZyivzGFBh/FCJQmSDfL@lists.linux.dev
X-Gm-Message-State: AOJu0YxvFwqf5HKLSQUJtrK8T90boDWtNsNsc5nH9mOSDRS0LvNwGckB
	SjN3SJUikSEQJ3Q2yv3hVufYB5hr14uKNBWZ4z69PJC0CgiCQmI/TsJIix32yHNSHqiDTK5RXve
	jRA==
X-Google-Smtp-Source: AGHT+IGGFBPehWleZC7XacBr2c3VKS/i1pCA2xiI3p2Sl/k9XQN0j6oRQyRybzYCeQIxtNewnoAH//KfiNc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:23c6:b0:6de:19f:34d7 with SMTP id
 00721157ae682-6e5bfbd6b2cmr929207b3.2.1729540298379; Mon, 21 Oct 2024
 12:51:38 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:51:36 -0700
In-Reply-To: <6028e1a0fad729f28451782754417b0be3aea7ed.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1726506534.git.roy.hopkins@suse.com> <6028e1a0fad729f28451782754417b0be3aea7ed.camel@HansenPartnership.com>
Message-ID: <ZxawyGnWfo378f3S@google.com>
Subject: Re: [RFC PATCH 0/5] Extend SEV-SNP SVSM support with a kvm_vcpu per VMPL
From: Sean Christopherson <seanjc@google.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: roy.hopkins@suse.com, ashish.kalra@amd.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, jroedel@suse.de, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	michael.roth@amd.com, mingo@redhat.com, pbonzini@redhat.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 18, 2024, James Bottomley wrote:
> > I've prepared this series as an extension to the RFC patch series:
> > 'SEV-SNP support for running an SVSM' posted by Tom Lendacky [1].
> > This extends the support for transitioning a vCPU between VM
> > Privilege Levels (VMPLs) by storing the vCPU state for each VMPL in
> > its own `struct kvm_vcpu`. This additionally allows for separate
> > APICs for each VMPL.
> 
> I couldn't attend KVM forum, but I understand based on feedback at a
> session there, Paolo took the lead to provide an architecture document
> for this feature, is that correct?

Yep.

> Just asking because I haven't noticed anything about this on the list.

Heh, there's quite a queue of blocked readers (and writers!) at this point ;-)
