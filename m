Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B6B7F7C1
	for <linux-coco@lists.linux.dev>; Tue, 19 Mar 2024 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854966; cv=none; b=aIn6mJZqZucOZr3b38nFDPmMEMHoECrWk4NYit8vaAcli8YGAGXOUE9jgsoH8SxWIRIx16blt2unk58JHWrM/eTrxXg+LDnYmxIMH7i/8lybDmfly7U5JFxs9vZG7EBePjHCSEWdJh8WliHBHQ9ubMJmXvDstdJsWWecNan8k5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854966; c=relaxed/simple;
	bh=OIbQlzsfSD0YGMHVIIMN8w6okEd4fWVbyCD6CUm4PPs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uXJudKS/qmsYzORFOKo2HGq1GVk+Sxgb0Qoqa/BukWjSxLTWRf285N357AlOYkbRSVCQaxOuc5v1KuSXjLlDzEO7ae8pUhi+/2AsReAB72SMMfXhA7a68oAI2a2Y2TK+NgmtlnDzWda5HdYhI8hCzEkSAC87mD8I0q8y2/GECHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=6+YqyuYY; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="6+YqyuYY"
Received: from smtpclient.apple (p200300f6af22b0007ddac50b016b9436.dip0.t-ipconnect.de [IPv6:2003:f6:af22:b000:7dda:c50b:16b:9436])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 24B351E90CE;
	Tue, 19 Mar 2024 14:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1710854962;
	bh=OIbQlzsfSD0YGMHVIIMN8w6okEd4fWVbyCD6CUm4PPs=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=6+YqyuYY0aOtCoMsH2GlxAp7MqeG9ybtZgVKRFzrHa5T5UcYj5tPK3JzcarRgebzs
	 YI5A7M/09wdg6bXGDnDN+e/55jrzZt1BsLXcTSgPjdIAlrg3KbhbMnJWKiROO3TyoY
	 MtqhuVjgS9AGTTzfARN79cRMWwjYttpSqCWvFXMBLF8k08ITHv0A2iaZhy4MZs7KGv
	 sd86qlu/0tN6+yxIRdkeGlzJRYP1ZZ8mBk5x0gURUOt50+SWTB887vHa8Wex2+Iq4r
	 LW8b57p16/E5fmaMBQdXg2+jla2AEQjp3YT6Miy/MK8v7eevWMqLdDv+Pr3bvGbUgm
	 4Poc3hOFGEGCw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [svsm-devel] SVSM Development Call March 20th, 2024
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
In-Reply-To: <7e201984-862f-4503-bdfb-006dc685f205@suse.de>
Date: Tue, 19 Mar 2024 14:29:11 +0100
Cc: svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <4CE8F00B-BD52-4FFD-92D8-CA94B9640BCA@8bytes.org>
References: <ZfmPIXGDd-69c9xp@8bytes.org>
 <7e201984-862f-4503-bdfb-006dc685f205@suse.de>
To: =?utf-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
X-Mailer: Apple Mail (2.3774.400.31)

Hi Carlos.

> Am 19.03.2024 um 14:20 schrieb Carlos L=C3=B3pez <clopez@suse.de>:
>=20
> On 19/3/24 14:12, J=C3=B6rg R=C3=B6del wrote:
>> Hi,
>> Here is the usual call for agenda items for this weeks SVSM =
development
>> call. My agenda so far is:
>> * vTPM merge
>> * SVSM attestation architecture
>> * Vendored dependencies in the repo
>=20
> Should we also discuss the status of the TryBox PR?

Yes, I was trying to get someone from the Rust4Linux crowd on the call =
for that discussion, but I have not heard back yet from them. That=E2=80=99=
s why I didn=E2=80=99t put it on the agenda (yet).

Regards,

J=C3=B6rg

