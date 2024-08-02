Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF57914A0A0
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722601668; cv=none; b=sObSs+o45buVoGCYD5kdSZhj2ADNM4zrfD5bDVD91Pp68QSm0C3mT49NENmUMaNWzyBRWqmoSsSad3XEStVEX0T6FF7nm8vBUjCF/qXMQivbyLLE0SvRm/30I8b2EvOrq5xApRvGVRJvYtUwoABCQ0SK3PDAFaPzZ8tCsXvF2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722601668; c=relaxed/simple;
	bh=ehJmNXeRI5h5/9cGjpEpWbixRarVBVri6cqhMKc5DpM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XpGVkeZJQVc29pGTef8hrkiNIYIjwNdgNCopAVxaNlBKjmKJsQLMevZQUwM5EontR9T2n5cBZqbRCPJM26vOUdroV3X/JhP1hLWhrxOapo31ngNpPVV7SylHNzQlVG0FHAaScx7kdssVnL5+4CIBVevN6oBdnmMN9xKta0uuksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=N+rgOqFz; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=N+rgOqFz; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="N+rgOqFz";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="N+rgOqFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722601664;
	bh=ehJmNXeRI5h5/9cGjpEpWbixRarVBVri6cqhMKc5DpM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=N+rgOqFz6LUfn5G1yoisnnDLMvklXGeDpgYXzeB6ZJQ8wLZg/t1K//F+f4aTBsRUc
	 4vBQtTJts0sJtgKXII8b1sAM7vaIr2vLa/PUYBpuDq/+T1J8IKd6RXfu5ck3VLKtq3
	 qrUxkmwlpa6UmtSPkIB+tgFIvRLCTqt85rGRJ4Ug=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 923A11286B4D;
	Fri, 02 Aug 2024 08:27:44 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id PcU_PQArTxXu; Fri,  2 Aug 2024 08:27:44 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722601664;
	bh=ehJmNXeRI5h5/9cGjpEpWbixRarVBVri6cqhMKc5DpM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=N+rgOqFz6LUfn5G1yoisnnDLMvklXGeDpgYXzeB6ZJQ8wLZg/t1K//F+f4aTBsRUc
	 4vBQtTJts0sJtgKXII8b1sAM7vaIr2vLa/PUYBpuDq/+T1J8IKd6RXfu5ck3VLKtq3
	 qrUxkmwlpa6UmtSPkIB+tgFIvRLCTqt85rGRJ4Ug=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 648A21286A72;
	Fri, 02 Aug 2024 08:27:43 -0400 (EDT)
Message-ID: <13ea31e26a9891722748c5d6e823f77b6c8b7809.camel@HansenPartnership.com>
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
Date: Fri, 02 Aug 2024 08:27:41 -0400
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
> It describes the current TD Partitioning based vTPM design.

So this design follows what was in the ephemeral vTPM paper

https://dl.acm.org/doi/abs/10.1145/3627106.3627112

and is what IBM demoed at LPC.  However, the weakness in this design is
that there's no challenge for the platform attestation used in place of
the EK certificate.  We tried to argue around that because the
ephemeral EK changes on every boot and should thus mitigate any replay
concerns, but that can't extend to a stateful vTPM and we needed to
support both (and letting the attesting party provide the nonce even in
terms of the EK hash is still not good security practice).  That's why
the SVSM API includes a vTPM attestation protocol that allows the
external verifier to provide a nonce and dispenses with the EK cert
emulation protocol.

Regards,

James

