Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C6175D5B
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722613210; cv=none; b=IleaRFROW3Daq38ORt3wmrMAK8sDZSBE/D4rVsTAflAZi1rk69U7h1lLebWNGE0edu5e862735sRkrtWI0wuoyY7aNhZTVPvMNUUuZGfbyWphaz/9aZIu/ZJDx1mC2HU4mtHFiZUbN49vxPk3fSK+r40HEGAlEHyBvbREPIcTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722613210; c=relaxed/simple;
	bh=ZqTZxl1f7hHSYads89mSe5JJkcDCBo90kRJiGVnGXxA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UI4d7+pXNXFtLnI7Y4+O5zBkuiwlalTF2L6z42CnjkJfQvHr7zJjZxWqIn5lK2yy2WlrtzSH4fBjruYRy20t1O/4/Ay/5S5O7Y2WEVf9lMHwzsy9gUjvFMKNfZWIwkwzccBP4/xvxMk8eIMxQ7S/+3H5wnqOCBPV5xhk2QzLZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mfxw+/oh; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=mfxw+/oh; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mfxw+/oh";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="mfxw+/oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722613207;
	bh=ZqTZxl1f7hHSYads89mSe5JJkcDCBo90kRJiGVnGXxA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mfxw+/ohJHbjMdcQFLxe3cL8j9X6V21x43bWoIESbeiULLHRLSDIeOeC1TieU4fmE
	 hnCJL8l2B7t0gEP9upsinHl4wg/0hiU8VyIiG+nbR4Vf4nc+kktg9QmAVsuLQHxOrA
	 t+7ZyfYDBjrziNbGZthJwxqMmcDci0Em6moHrxzs=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id E8030128184B;
	Fri, 02 Aug 2024 11:40:07 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 8J05HWHi98VB; Fri,  2 Aug 2024 11:40:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722613207;
	bh=ZqTZxl1f7hHSYads89mSe5JJkcDCBo90kRJiGVnGXxA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=mfxw+/ohJHbjMdcQFLxe3cL8j9X6V21x43bWoIESbeiULLHRLSDIeOeC1TieU4fmE
	 hnCJL8l2B7t0gEP9upsinHl4wg/0hiU8VyIiG+nbR4Vf4nc+kktg9QmAVsuLQHxOrA
	 t+7ZyfYDBjrziNbGZthJwxqMmcDci0Em6moHrxzs=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id C3DB9128104D;
	Fri, 02 Aug 2024 11:40:06 -0400 (EDT)
Message-ID: <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 =?ISO-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>
Cc: "Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie"
 <eddie.dong@intel.com>,  "Johnson, Simon P" <simon.p.johnson@intel.com>,
 "Reshetova, Elena" <elena.reshetova@intel.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>, "Perez, Ronald" <ronald.perez@intel.com>, 
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Date: Fri, 02 Aug 2024 11:40:05 -0400
In-Reply-To: <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
References: 
	<MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2024-08-01 at 22:38 +0000, Yao, Jiewen wrote:
> Hi
> As follow up, we have drafted the vTPM document and put to
> https://github.com/intel-staging/td-partitioning-svsm/blob/svsm-tdp-vtpm/Documentation/TD%20Partitioning%20based%20virtual%20TPM%20Design%20Guide%20Rev%200.5.1.pdf
> .

Just a note for the vTPM reference implementation which, I think,
applies to both you and the current SVSM-vTPM: the reference TPM
implementation has moved to

https://github.com/TrustedComputingGroup/TPM

And the one you list (https://github.com/microsoft/ms-tpm-20-ref) is
now a stale copy that isn't being kept up to date.

Regards,

James

