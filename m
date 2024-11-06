Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018D1DFE3A
	for <linux-coco@lists.linux.dev>; Wed,  6 Nov 2024 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730904862; cv=none; b=I2g4RWkmjNfGV0YkuM21iex0OLOYR18nKbsxXJvaUadPK4/QZC//JBMNUmAAPwEAmtSv/32xL8j98qNKLO9Lre6Ue5UGm3YqR4o8sG7RepuRsMly/xniaAS9US9HQxVh+bPhDAzQg/B20E6SSZo1zOpWbMMPl0fHQMrOgWijwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730904862; c=relaxed/simple;
	bh=6HqB3vFZjwgXeV/Un0bSXSV3+6b++JIYKuBjs3FQ10A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCQo23ko3T559dKfdmCe/z34R3BdI6aT4JjfwPGS87AK3LkID8x4Tm92BysWuB6C3dqmJ8KF0DetDx2/LD5nQKN8vWnIlJNzUpqYRM0wMU1mPKEhsYZirWd95tKyXeMWJB4RiZZQkiWDxZfaCUrU986GKW5jsYdVtuTChw93WIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=BcwEqqZI; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=FR7dcZ5+; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BcwEqqZI";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="FR7dcZ5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1730904858;
	bh=6HqB3vFZjwgXeV/Un0bSXSV3+6b++JIYKuBjs3FQ10A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=BcwEqqZIyuD5qb1HgKYE0N1g92zk39T0+B4uA33gHkTMwdgFofm5k+BAv6cK9Tmwr
	 S7CYvn/+A7mxd47Goe2KztPow3vLIbkVYGiUafHTYI08IZG7EhfjNGS1djsqAjfdR6
	 mElWHK1ytgf9HaVVlSQPY6plfZojYnedGcruUFGk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1C11E1286A22;
	Wed, 06 Nov 2024 09:54:18 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 7t1WwdyJgk29; Wed,  6 Nov 2024 09:54:18 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1730904857;
	bh=6HqB3vFZjwgXeV/Un0bSXSV3+6b++JIYKuBjs3FQ10A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=FR7dcZ5+Tdug+3XdoLnwQCyixtSQk+Ha7ndxtm3fbWpOgXnXt1lrdtsWAqK+n9s8u
	 T/QMKZPHNuyvrUXzCPsr1XnR+gYCWm+8lxtCSIaUHULQfdj1IW0McZcjzW+Msdb+pc
	 7mwAdAP1mZmS7vV2irxCcfky/Kl4nF517Bwesh/s=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EFC8612869C9;
	Wed, 06 Nov 2024 09:54:16 -0500 (EST)
Message-ID: <124b138ba19fb0e6bf82b09be1217b8d5d829018.camel@HansenPartnership.com>
Subject: Re: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: linux-coco@lists.linux.dev, cclaudio@ibm.com, osteffen@redhat.com, 
	jroedel@suse.de, Dov Murik <dovmurik@linux.ibm.com>
Date: Wed, 06 Nov 2024 09:54:15 -0500
In-Reply-To: <hcttb7s5yvur5oigge2xlbspyi26ngrgc4unn7ewv6px6vgukv@mp2relslhh6w>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
	 <hcttb7s5yvur5oigge2xlbspyi26ngrgc4unn7ewv6px6vgukv@mp2relslhh6w>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-11-06 at 12:19 +0100, Stefano Garzarella wrote:
> Hi James,
> 
> On Tue, Jan 03, 2023 at 04:01:33PM -0500, James Bottomley wrote:
> > This is a sketch for how a fully enlightened vTPM driver would
> > work. The idea is that the SVSM responds on function 8 to vTPM
> > requests, so we use that to send down a buffer which is modified on
> > return (the buffer must be big enough, so the agreed protocol is it
> > should be a page in length, which is larger than any possible TPM
> > command or response).  The protocol used is the MSSIM one which is
> > self describing in terms of length, so there's no need to transmit
> > sizes (it also leaves room for expansion to localities and
> > cancellation, which is useful in the light of discussions).  A NULL
> > in place of the buffer is a probe and the SVSM call simply returns
> > SVSM_SUCCESS without doing anything.  This can be used to probe for
> > vTPM support because any other return would indicate no vTPM
> > present.
> > 
> > Hopefully IBM will publish the new svsm-vtpm repo shortly, but
> > we're still working with the old CRB based one at the moment, so it
> > may take some time.
> > 
> > The three following patches are for two different repos.  Patch 1
> > will apply to any upstream Linux kernel, Patch 2 requires the
> > non-upstream sev-snp repo and patch 3 is against the non upstream
> > sev-snp edk repo.
> 
> Thanks for this series, I'd like to restart this work and Claudio 
> pointed me here.
> 
> IIUC the last version we have is the one in Coconut [1] which is
> based on this series, but with some changes on top from Claudio to
> probe SVSM and check if TPM commands are supported or not.
> 
> I already rebased them for 6.11 here [2] and we will include them in
> the next coconut-svsm branch, but in the meantime I think nothing is 
> blocking us to upstream them, so I can take care of Linux patches,
> while Oliver (in CC) is working on the EDK2 patch.
> 
> IIUC the only thing missing from the patches we have in Coconut are
> the fixes to Don's comments. Do you have a branch or patches with
> them already fixed?

What are Don's comments? Did you mean Dov and this one:

https://lore.kernel.org/linux-coco/f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com/

? Sure, but I thought Claudio had already addressed those? I can take a
look to see where this is, but I haven't been following closely.

> Otherwise I can do it on top of the patches we have in Coconut.
> 
> Any other things to fix/improve that you can think of?
> 
> Let me know if it is okay with you that I will restart working on
> these patches.

The original was pretty simple: a platform TPM with a single
send/receive and the implementation inside the SVSM call code. I think
the only real change is switching from the msr method of calling to the
ghcb one, which it looks like is already done (or at least indirected
to the proper snp wrapper routine that does it)?

Regards,

James

