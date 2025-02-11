Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C493253350
	for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300615; cv=none; b=efZ8LszWBHOwINVaG4XAHktsl5aZHUfAJ4pvihhIApGpaRZP4YFW/Qm8PpC0sxOujBytA3OC5HJ0rF/T4MXGG2qyLEPj/l7a0LmZFqkRdAc5yiY4eTKnPg76CTjSAScKKtFzeYBlIgSp6OoPsB70D/LhIuAxFCqWo6F8EDmRoI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300615; c=relaxed/simple;
	bh=aFRbjSre0n/PpbhfPdOu1q5jYzsALXfM3ldTnjaDe4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y4rrr53aFYfHPWOc8+53iLtYdjuSYnz3Lf1zQ6ZK3F6GqqHoLWWCIZ4ZyH+tyY7RMXg0/2O9XSupZixQTy4ZqIYoKYlqc/KQTfEYITatIqXrjC/A+h8+aAfbNYopohRphrcMhDTOz/HZgZ3B0ckPg76govdrb2h+ZD9m6jUd41A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cv5L6rSD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cv5L6rSD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f68852b7bso128774975ad.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739300613; x=1739905413; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RZHwu8fSUx1PRlASdGoMqhsw6pMz1JSKazfVdmFy0=;
        b=Cv5L6rSDPNGvzvuudYZwO6YcDoLb9Ebx4MY2bAJ/JF5X8Ksf02wQGsrHVKCN1dhD3Y
         ND1aHx2HpaLD+k3nfBDp5BjO5IdW7xGdT9R6oXrvcmsYtKtQKDy2yT6xJ5sxKrremMCO
         7MhS5zwREbDzXe8BlG8mopiOfjeJcS5tr7/EWkLhvOrz3W1C4Fj4m0TF+43VoGE3/LcH
         wplU+5nmiUUkDzd7mvOArbuhpb54oofnG2mSXKKrA7IKj5Sa/0HqqZZeB2f27ZuKzjo6
         ZYpLYc6Eo6Bz486BXtoNN7xwsjedIOBqDeU8DR6Fx+/AHIdrT4E4YKBA8D0CT9wy9nTX
         aRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739300613; x=1739905413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RZHwu8fSUx1PRlASdGoMqhsw6pMz1JSKazfVdmFy0=;
        b=KcqfninVIBgjJJl/YCWMV9uhNaXNtwdMO+wlmXfQ+5EBGlUEbGFWk/2jCGvjf3if8K
         9ugFbbRnGclIOxyzBXqqSEsbqxmAhdAA05mCsH8UmG7TFYpr+tQcuMVA3aJO9Zg3rLUo
         NtxnaVh9WW4KM8N7gSTdT16CMDG5LXNz0+eCRG2Jruj7Q1QYDrmiWzj062kVPiZkuFG7
         o5j66Ud8tAxWV1avfBPl/tgluym1Y0oiGLypvi5VTOMfOKPlibxOIo41kgmW/h7CiQyA
         wd4jUEMjzMYjS/lbUYKztGxfSm0bGhUJlk0HdJLIYtR7LkRuRB/XPGAyFIU24g39d8Sg
         FbkA==
X-Forwarded-Encrypted: i=1; AJvYcCVoyZSe8gfstds0pEpAwhq8QY050v3jnKvMMVhX44p8k+w4QV9qo5m5giJc9X89w0MTvb6IgULiFeWj@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs5/NhLlERCzza3C8O/DDvqeiVmIeO/s6xX6J14EYVE28QOgcK
	k+V+Uyf/EMDaJYi3HZUG3GJYtjUGNiB9Xi3ierI27H+FGl+aHfphU45+46kyG9A5QLFwp7x+9gn
	f3Q==
X-Google-Smtp-Source: AGHT+IF83FAVS6JbAJzhSAAsNQR7sGHkfYmlENylg6JcCsQBTAIdcwm5DyQRH0pv2Gc0GyUcz7M5iSbKK64=
X-Received: from pfbbh7.prod.google.com ([2002:a05:6a00:3087:b0:730:7b6c:d5d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:258e:b0:1e0:d6ef:521a
 with SMTP id adf61e73a8af0-1ee5c732f01mr650938637.1.1739300613311; Tue, 11
 Feb 2025 11:03:33 -0800 (PST)
Date: Tue, 11 Feb 2025 11:03:32 -0800
In-Reply-To: <20250211184021.GFZ6uZlZWPVTI5qO1_@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local> <Z6uIGwxx9HzZQ-N7@google.com>
 <20250211184021.GFZ6uZlZWPVTI5qO1_@fat_crate.local>
Message-ID: <Z6ufBMy4u0jcmIl0@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Tue, Feb 11, 2025 at 09:25:47AM -0800, Sean Christopherson wrote:
> > Because obviously optimizing code that's called once during boot is super
> > critical?
> 
> Because let's stick 'em where they belong and keep headers containing only
> small, trivial and inlineable functions.

LOL, sorry, I was being sarcastic and poking fun at myself.  I completely agree
there's no reason to make them inline.
