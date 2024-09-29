Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E81918EB0
	for <linux-coco@lists.linux.dev>; Sun, 29 Sep 2024 23:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727652255; cv=none; b=nNSP+RyzFxKSUcnIJeYAN6cMOn3UPxZds/X4haOaEbOqiMIHDER43nn0Jol5ya8kZWaJ9wlepJcLYFpeMY0RsYMWVOC/r7omyEY61oN8RNBbuptXVG3btgMqFr5cGd1sZ5d49T8Sr+lZWa775zaytjFK6V6uGc1ONrf3GiuU4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727652255; c=relaxed/simple;
	bh=bki2aojO0okbOHSelxhv1BvacmDt7ZY695ggegmuZao=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=al2uF7sTOYNCEdLnI/NH8EgXdzc/sxayG2M+1rONJAJzj0lNUkCFk9/taay+J5hcdq171mevatXi2emDeRlaCizJkYlbPZpdAM7Rm4uNkBWQdBXdCXUEG0afskxXC8CcZ08zwEHqT+fJJygsiOxbFTyNx+l4BFVA82I6DqZ4pzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=Maw+mguT; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=Maw+mguT; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Maw+mguT";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Maw+mguT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1727652252;
	bh=bki2aojO0okbOHSelxhv1BvacmDt7ZY695ggegmuZao=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Maw+mguT4ddPsaSVpLHWWqeZNkbg1CD95crLEs2wKU9YJz2Obl3Vhr8pmR3R8LT0R
	 VfVSqQpcIXeN8RCN80JPuwAZLd+OHsecrzX5HymaJUmRaRTbSjlomC5rI5qW3rUnQ5
	 gCBl0gNjD/oeqxDL21qg2EdKWPzfN20xwkd/CAMg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3292512869F1;
	Sun, 29 Sep 2024 19:24:12 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id YcgySkOvJTiI; Sun, 29 Sep 2024 19:24:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1727652252;
	bh=bki2aojO0okbOHSelxhv1BvacmDt7ZY695ggegmuZao=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Maw+mguT4ddPsaSVpLHWWqeZNkbg1CD95crLEs2wKU9YJz2Obl3Vhr8pmR3R8LT0R
	 VfVSqQpcIXeN8RCN80JPuwAZLd+OHsecrzX5HymaJUmRaRTbSjlomC5rI5qW3rUnQ5
	 gCBl0gNjD/oeqxDL21qg2EdKWPzfN20xwkd/CAMg=
Received: from [172.20.40.167] (unknown [12.248.214.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7A19F12869EC;
	Sun, 29 Sep 2024 19:24:11 -0400 (EDT)
Message-ID: <8f3d4a792b7a842dbbc3e365c36f68b8e1549363.camel@HansenPartnership.com>
Subject: Re: No CCC Kernel SIG / device security meeting 9/27
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: "Quigley, David" <david.quigley@intel.com>, Dan Middleton
	 <dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Date: Sun, 29 Sep 2024 19:24:08 -0400
In-Reply-To: <LV3PR11MB8458463D0347DF7A217B5CCDE56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
References: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
	 <LV3PR11MB84582F1DDE696387B6272874E56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
	 <4065661639dd917f3410e51c23a65e4bb88fdaf3.camel@HansenPartnership.com>
	 <LV3PR11MB8458463D0347DF7A217B5CCDE56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2024-09-27 at 20:15 +0000, Quigley, David wrote:
> Do you know if there is another part of this stream? It appears that
> the above link starts in the middle of Derek Miller's ARM CCA talk.

I'm afraid google seems to have done a very good job of losing pieces
(or indeed all) of some of the streams this year.  The broken out
videos should be posted within a couple of weeks (I hope).

Regards,

James

