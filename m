Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C9114A60C
	for <linux-coco@lists.linux.dev>; Fri,  5 Jul 2024 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720205760; cv=none; b=WrAmxH6kvObTkbEsFAhxqDbmM8/vD+DXJnS1jt+G+hDV695mBMr/sG0XqwbZlvxISdf/hw9gL75spG6HBj4tPuZkzDTdKEteNLYGR4M3qRRTI0PHhLUVCAkVQIYAXP0xAwYvxVhrqX3MPluXm88owg2PmdTqXEgahIBpXh6bJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720205760; c=relaxed/simple;
	bh=crLFsjy3aYw8IUr9kg3Bgeau9zFg4Rj+PWHrP/Wxqog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJzupnQQz+MQLVVdNp366CqGUGiRl8ZnQYxTo7jbSOpi1DYIFzTmzGqfhQ/ZadoRkrQnuUdYInPgo7RwHvEbidA0pL8wZ3ZLAt9fL5VmMBiWcud9Nn6LMEeDAMrsegKpvCjFg+zH1sKI1ls1JJt2/u9LwFP/6FWKXfajPPaxULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GC96LAE7; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GC96LAE7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-70df213542bso1081888a12.3
        for <linux-coco@lists.linux.dev>; Fri, 05 Jul 2024 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1720205759; x=1720810559; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaVLjoHzTdUX4sBfGSImQvpT2vm1WoW6FtbAHmtzZVw=;
        b=GC96LAE7+OlJUJkrmqQXqblLzEOjSyI/hqwnLHUC1BbDnpQUMcScXYZeSiDofcoQgR
         xWCwgcdgsLhc9uqLo1+LVhu+L1n+NkQ7b1NLtaIeDmuaXpuo0L/emK0oy+qIqBf3jUmw
         9nUwfrv1EyYiX4KoLhHkDSwiGs3FLv3+O2V9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720205759; x=1720810559;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaVLjoHzTdUX4sBfGSImQvpT2vm1WoW6FtbAHmtzZVw=;
        b=G9KzN72UkzII9T4m8mMTM3koSGqRy4u3FJEISy155WzgcL3IQAPppxOxJzdB4DWgov
         83dInrpF/aVBsO+YOpxc42b26LxpsKG4XSw0Tixq0Z/iYfMrqEGJ0w0DDpxNbsuKMKZh
         cCad87rUTsJpP6AF8cOlvOU5kn7zxHfmSqAKTbmRngtXPiRi9Dp45G/kUphFmhiG9pd3
         YZq3p8gvRhiZTjfpqiW86ZqlDsxIl89dZWJ9nRtEYscpZwtjbuNaDCp4nvrYDAQygqPK
         CXX9JnEZp+Dqalx7bNctbYPWkBGQLzNYLYbid/XxdtY/HPsagokjfedvsg46rQqP6/z4
         PHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhk++Q+Q5+hJyslbVgQY03GuD7Wt5oMpSC9fni5a/8M2EgKLqxPljr7lEhdnPQFVN/LdnhFCHC5QXJfzKyBLmkeA8YJjVNccZC7Q==
X-Gm-Message-State: AOJu0Yx55FLvOh2Gl+oYjJVS/FxmYaVM1v/RjVMwlJ3dFV3Bvgv5zq3i
	koJaQv9XkO1ddN/CeAvnqlfE+2HQPcl39mtpiJ1rhcVV/KwYNiLFN+RvkfeqsQ==
X-Google-Smtp-Source: AGHT+IEZDDQ1xVg8ajrF910XkrCyc3T3zygzrPPfal/9dd33RTK+teUfJ40f9RPfqO1AZQzPqLGOmg==
X-Received: by 2002:a05:6a21:6f01:b0:1c0:defa:b68e with SMTP id adf61e73a8af0-1c0defab8e3mr2032690637.39.1720205758826;
        Fri, 05 Jul 2024 11:55:58 -0700 (PDT)
Received: from prme-hs2-i1009 ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb4f6884b6sm15663335ad.48.2024.07.05.11.55.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 11:55:58 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:55:39 -0700
From: Tim Merrifield <tim.merrifield@broadcom.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Xin Li <xin3.li@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
	Kai Huang <kai.huang@intel.com>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Brian Gerst <brgerst@gmail.com>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	virtualization@lists.linux.dev, alex.james@broadcom.com,
	doug.covelli@broadcom.com, jeffrey.sheldon@broadcom.com
Subject: Re: [PATCH 0/2] Support userspace hypercalls for TDX
Message-ID: <20240705185529.GA16769@prme-hs2-i1009>
References: <cover.1720046911.git.tim.merrifield@broadcom.com>
 <20240704130505.GT11386@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704130505.GT11386@noisy.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Jul 04, 2024 at 03:05:05PM +0200, Peter Zijlstra wrote:
> And how are we to ascertain the software using these hooks is deemed
> secure? What security risks are there for the kernel if a malicious
> userspace process asks for these rights?
> 
> The kernel must assume malice on the part of userspace.

Thanks, Peter.
   
I don't believe there are any additional security risks for the kernel
itself being introduced here. The kernel is only responsible for
copying to and from userspace registers for the hypercall, and
executing the TDCALL. A similar approach already exists for AMD SEV
(see vc_handle_vmmcall), which does not restrict VMMCALL in the way
that TDX restricts VMCALL.

In the case of a malicious binary running in a TDX VM, if it wants to
communicate with the untrusted hypervisor or other software outside
of the TD, there are several existing mechanisms it could use, not
just a VMCALL. I guess the point here is that if the userspace
program is malicious, is anything gained by restricting VMCALL?

This patchset really only handles the case where a trusted guest
wants to limit access to VMCALL to binaries that self identify as
hardened against potential host attacks.
