Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A048CD52
	for <linux-coco@lists.linux.dev>; Wed, 29 Jul 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331714; cv=none; b=ihNsVKQfGddxmON98jmYkikbL9MaFfE3OeDa89cJVcVkFF8hYD9jwWUcQYFQPoBFdm9caLP8TM+UuMG8W7NyGEaHrDacDataN9ECJNR1KkEIFhybM3ZVBugbxhKE9+jeHeI0/xEsQTkvEPMATHRgiCqi5Y8vas8e3l1ISrRYcPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331714; c=relaxed/simple;
	bh=uVa1dC7xe1aAeUnbgl4sqICBfeNILVt/mq2OEqNA2R0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K0kBRHaoyJaLVkAo3IyWQsWqE9ksu00GfpdJA4WQsmB5yF5iDvjLyJVq8vuINtC7SvKFS3PJp45cw2IQtT+hJC8hXnEmVV0EqbVG1YI3x56Swnv69H/mP6SLPpXjXYk2NaKLARs0m5vwA0wMgR0cNwag3sNq0iQ7zz7LD+9nzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ra8Sd0DS; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ra8Sd0DS"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso844451a12.2
        for <linux-coco@lists.linux.dev>; Wed, 29 Jul 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785331711; x=1785936511; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1Uw7Rea6IolmWTWAWQHNW+WUS1KBbg7Hs/3YV9RZGI=;
        b=Ra8Sd0DSGLxGk9aueVIB4KIJnYF8YKTAYwIfrmkfEJHkbjchIK0zH+mOa8Rr37mNSi
         A0SHcFdg+UQDRHnh0S6SNlhBfuetNVXoM3Isa7u5JyW+RF83kWEMyYnDpo2MyQykr5eO
         u49Lwr23RIFpqRd4r/Pf+llSK0hx7/0jhps3HKfihkpjNpPkHrHFjSRTAeU73iYhEPQe
         0AV3NcU9hGEtd/JADvihKP9DDUXSlP4fJROBNt5C4GkMHlUe0jmN5hVhiusgBmhs/gZr
         khsnWobLJdZxat0ojkronyc5jQl3SxIlm3f3XSo3mzdLF3a0t0GjUGZYHG/ErXwcVdCk
         76Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331711; x=1785936511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Uw7Rea6IolmWTWAWQHNW+WUS1KBbg7Hs/3YV9RZGI=;
        b=X4l+UFShrZdPUnLmxcVGuU+/Kl0YEChc6623ihbk0p3rbp4845pzLtrfMDwrujghtI
         gWzCWQZi9TkkfSn6TebGYHb7aK1gb9Ht9HUo/t2PYBOsERnPKfGmeaMA0iO4G8tsRueY
         si7GTedaYC7jutsWYFagvm0AFCtX31f5gzMoHqfIVnPmBCmrjHlAwmKv0BckYkLF1yzO
         DH0JwinhYr9NEddG6ssMxYJv5egqs6s9GZYyXr1XizFRCsjXv1go5//whSlcU3eQotYB
         rYZmXTTNB6bdk8o+LswakQBWGemR8mkyG1k34Zeeb4VdEV63vX/3NeYomvtvfBaVPaj9
         IftQ==
X-Forwarded-Encrypted: i=1; AHgh+RptoKZ2nNQ68fGYZ5UORr9fuGCb6u4VjXjGunt8sjOGP0JqrbxtzNDZLnW8Y6GY+pBZmt7+6HHwz7IH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Dft5U8qNMMUhz+tCWNEs1/MhMjmTgd60X4KwqO9CpoE6cj8i
	IC0ThW8wdWPTYOsv4DlWVldNDG6jSzMq1xj3DLHG4szNQX/Mlt6cNuxUhclZQ5Ewa9TvLAsb6rv
	lsxUz9A==
X-Received: from pfcf6.prod.google.com ([2002:a05:6a00:2386:b0:847:8e58:df6f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:990:b0:848:2f74:d8d0
 with SMTP id d2e1a72fcca58-84e934463aemr7142102b3a.65.1785331710486; Wed, 29
 Jul 2026 06:28:30 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:28:29 -0700
In-Reply-To: <20260729085908.21368-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729085908.21368-1-jirislaby@kernel.org>
Message-ID: <amn_n5dykcLAHVoz@google.com>
Subject: Re: [PATCH v2] KVM: x86/tdx: Do not print error message on
 non-present feature
From: Sean Christopherson <seanjc@google.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

For the scope:

  x86/virt/tdx

because this is no longer in KVM's purview.

On Wed, Jul 29, 2026, Jiri Slaby (SUSE) wrote:
> Before commit 165e77353831 below, the kernel did not print anything
> during boot if X86_FEATURE_TDX_HOST_PLATFORM was not present, unless TDX
> enablement was explicitly requested via a module parameter.
> 
> After the commit, when attempting to load TDX automatically, this is
> emitted to the log:
>   virt/tdx: TDX not supported by the host platform
> 
> It is emitted with the "error" level, hence it is disturbing. It is not
> an error to run CPUs without the feature.
> 
> Drop this silent-boot-breaking error message for the automatic
> initialization path.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: 165e77353831 ("KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init")
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Chao Gao <chao.gao@intel.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Sean Christopherson <seanjc@google.com>

Reviewed-by: Sean Christopherson <seanjc@google.com>
