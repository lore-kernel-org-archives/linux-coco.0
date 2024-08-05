Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DEF165F17
	for <linux-coco@lists.linux.dev>; Mon,  5 Aug 2024 15:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871303; cv=none; b=e1la52Gi+ftgMvX4WvbRtwN1/iqUKTlkNzHGfAv/YRP6e3LkQwHjJf9U8CYXCaofMRHoqu42n9GOqq+eSeXLBCPfY1jzmJ9sIhGQtE9C6vGqVlE0o4+jiAD4UUIS2Vzaen+zO1/vdnx3zn+7p+zhaLtGgO+imRw1l05WXXtOO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871303; c=relaxed/simple;
	bh=tqk4cYexIk1xGB5igSVa/QQOd6Yh1/FpCWUs45fJgSI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LwDGJ8eWAoMecERMz3fymwBmRXw5/vZx/I5kU89Nw1YCs+qByBaY7Fit73RMyw+kSvE3397/fp5CkSqDh+5hmcVHOhP+Am96qYc/lNS9Md3N0hP5ugNCnRAIzn+a+n3YDsUBajG5GTprFQQ1h8WN3zfjUjlqdRAaOiOoZmLz5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QWtEvMbf; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QWtEvMbf; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QWtEvMbf";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QWtEvMbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722871300;
	bh=tqk4cYexIk1xGB5igSVa/QQOd6Yh1/FpCWUs45fJgSI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QWtEvMbf26tOtHdvNAZiQ/ba3hK3sEkaWoXwOeWvkvisLTSfQuY2beEbZLRrZbbNQ
	 HJkJ9rF98eJsSRPCXWkhAIyXvRKsEnFD3Zect98hk3eSRhLANsW5hhH/qQZ2qpmn8X
	 RRGuWVmE5ed0h0n2srG3FUt0FT2LWAOnoAu/k+QA=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 48F5412869EC;
	Mon, 05 Aug 2024 11:21:40 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id AkMw8HrN4HVe; Mon,  5 Aug 2024 11:21:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1722871300;
	bh=tqk4cYexIk1xGB5igSVa/QQOd6Yh1/FpCWUs45fJgSI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QWtEvMbf26tOtHdvNAZiQ/ba3hK3sEkaWoXwOeWvkvisLTSfQuY2beEbZLRrZbbNQ
	 HJkJ9rF98eJsSRPCXWkhAIyXvRKsEnFD3Zect98hk3eSRhLANsW5hhH/qQZ2qpmn8X
	 RRGuWVmE5ed0h0n2srG3FUt0FT2LWAOnoAu/k+QA=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 270EE12869E7;
	Mon, 05 Aug 2024 11:21:39 -0400 (EDT)
Message-ID: <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
Subject: Re: Coconut-SVSM - vTPM support for Intel TD Partitioning
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, Dionna Amalie Glaze
	 <dionnaglaze@google.com>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, 
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 =?ISO-8859-1?Q?R=F6del=2C_J=F6rg?= <jroedel@suse.com>,  "Lange, Jon"
 <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson,
 Simon P" <simon.p.johnson@intel.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>,  "Perez, Ronald" <ronald.perez@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Date: Mon, 05 Aug 2024 11:21:37 -0400
In-Reply-To: <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
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
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2024-08-05 at 09:55 +0000, Reshetova, Elena wrote:
> > On Fri, 2024-08-02 at 18:54 -0700, Dionna Amalie Glaze wrote:
[...]
> > 
> > That brings me to a curious point: is the Intel TDX SVSM going to
> > follow the SVSM protocol interface?  because if it is, it will
> > naturally inherit the enlightened interface (the code will be
> > present in the kernel, so it only needs activating).  However, if
> > the Intel SVSM were going to ignore the SVSM protocol spec then it
> > would have to reinvent everything and the CRB interface might make
> > more sense.
> 
> I cannot speak on behalf of the Intel TDX *SVSM* implementation, but
> for the Linux guest kernel there is no intention at the moment to
> support smth like SVSM protocol interface. We have made an evaluation
> on this during the spring. There are no usecases currently that
> require such new protocol introduction on Intel TDX and it does bring
> additional code complexity, etc.
> If anyone believes otherwise, please let me know. 

If you reinvent the vTPM communication interface, I can see you are
able to get away without that SVSM communication component. I assume
you've done the same for other SVSM provided services like
deposit/remove memory and vcpu create/delete, but what about migration
when it comes along?  Since the high level operations will be pretty
much identical on AMD and Intel it would be very annoying to have to do
it in completely different ways (with presumably different tools).

Regards,

James

