Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CF71C1AAA
	for <linux-coco@lists.linux.dev>; Mon,  7 Oct 2024 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325344; cv=none; b=gxYWeqL0FTKt9+IH4VGszgwqwoBrW4FjNkVYs+BPQCO5eoRHDTukh2Xa9BwjwbqW0qQ+mxI8k3mendwfkrbGemw3x6yB3oeUQkfL29Lz5+y7Oe8IHBfGeahCzmpzpOL5ftgXYHEKcGbZWOUdu4McTjuI3SHbSXS9nX82OoivzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325344; c=relaxed/simple;
	bh=D6kYjZYe8yK61wj3w11AYfxdTKyFCCn9W5eE8bX0OY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPSckKLHZ4D66tAsuzW/vhhJZitxU/HaIyorjDNwFkDiq9qarG1EHSdMVZMjfs1pkL0dKmOUDex+n0zk1fpJcUOk2+bXv44PUPQewyp1RKe+Le/gaDrqYlk9ZhkO2Bjl6RrFGveXcWPBUN/HVSbBTiD3pLuGso/oaEVvBy4xnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAYp0am5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAYp0am5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728325343; x=1759861343;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D6kYjZYe8yK61wj3w11AYfxdTKyFCCn9W5eE8bX0OY0=;
  b=NAYp0am5E8KqX9dbCaQrq8CYXTuPLxsP716h06XGT+1KwaoFyry0mFUw
   yqz6gw+YT/KTKk/bbkJJb8SR3HMuFEOZTW9UnbXZ1cJ2sJoGLze7hQ6+c
   jx/kDPJHMEKAzi0ixo6EjpUNj15qKquFSBksBps/mNEkuKy5kuloz2jt3
   wZW9mlCB5zBUIvrA46PsW0xVXwRWzfNRHKS67xO4wANSoPuDyJxG8DjHd
   55+6vJ7dAzK3xWEcVqgP845tueI/eBeXGBb7iElumRUqhPuS3Kql2Nrix
   uTf4RKZ9wFoaq6mHN+Uf9J0MdsgDjYtkvaSDWQ/mm1TpDColbsOUOi0KY
   A==;
X-CSE-ConnectionGUID: axdyvkoNT2a6B8C9AESctw==
X-CSE-MsgGUID: WJgM/dOASdCQ8lGFuzEqNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="26982913"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="26982913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 11:22:22 -0700
X-CSE-ConnectionGUID: PncrxXy/TGK1cy905clEJA==
X-CSE-MsgGUID: RIlTyyQNSxaC9Ro13XEHVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75518058"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.222.6]) ([10.124.222.6])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 11:22:21 -0700
Message-ID: <94d6047e-3b7c-4bc1-819c-85c16ff85abf@intel.com>
Date: Mon, 7 Oct 2024 11:22:20 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
To: Alexander Graf <graf@amazon.com>, Dan Williams
 <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>,
 x86@kernel.org, aik@amd.com, elena.reshetova@intel.com, pgonda@google.com
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
 <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com>
 <67005fcf46742_10a0a2945@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <5d1da767-491b-4077-b472-2cc3d73246d6@amazon.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <5d1da767-491b-4077-b472-2cc3d73246d6@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I figured I'd just write down what I think is the contract that we're
trending towards:

 1. Attestation includes a snapshot of the TCB, which includes the TDX
    module and microcode versions.
 2. There is a record made of each attestation which includes those
    versions.
 3. The machine owner is in control of the components of the TCB and may
    upgrade the components to a later version at any time but can not
    downgrade them.
 4. If there is a security regression in a TCB component (say microcode
    version $V), any TD that ever attested with microcode version $V or
    any earlier version should be considered exposed to the regression.
 5. The attestation record is the sole means of limiting the scope of
    the impact from the regression.

The subtle part of that is that the attestation really isn't for a
single version.  It's fundamentally for that version or any later future
version of the machine owner's choosing.

Note the "or any earlier version" wording in #4.  That's there because
even if $V-1 was not affected, an attacker could silently and
unilaterally upgrade to $V at any time.

It's probably also worth noting that the TDX module can't be runtime
updated today.  Microcode _can_, but I think it's entirely orthogonal to
TDX and they currently don't have any interaction with each other.

I assume it's the same in the AMD or other CoCo worlds.  I just don't
know what the PSP update model is on AMD.

