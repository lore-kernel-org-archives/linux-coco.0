Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F24A929
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673383036;
	bh=n8Nd7C4npcEuNX/Qgnbro1m/JPKNbhunKAuHMv82LLA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=dqV4W2gx4zZQpP5afLq8tHJ3GPzzoVGoHLRuYx3VrrlGOTpzhry3EaEBSDfFlJ8mI
	 tcq87WfyaPvKdWLSPYLlGsg2zM23UNVjqCmpHWInhYwoXj5O92lADTo04TyvLA3UxG
	 dwEEvG87SO/OlotzVTzdKTCiEOBDixYCpVev9PNE=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 13BB91286516;
	Tue, 10 Jan 2023 15:37:16 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKYuFcJ6eHNX; Tue, 10 Jan 2023 15:37:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1673383035;
	bh=n8Nd7C4npcEuNX/Qgnbro1m/JPKNbhunKAuHMv82LLA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=SDd8rnZ8Z8BvTKgZmGy7O6cwzvY7vUDpFJhIkjitX/KBqf+mUxjgXo7gSZC0llFhp
	 Ya3yfAUpanuuW0D/uXqRDDOdeATy1FAVknSZjfKHdP1F+KALEZiW4GsrFxk9rq6J1Y
	 2oRN2N1VOD1gzB0ldIvoeaKdGRnrs8fW51FjSYu8=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 5EAB1128650D;
	Tue, 10 Jan 2023 15:37:15 -0500 (EST)
Message-ID: <a7734e60f667d2d7b43a4a8e6da3d61fd6997666.camel@HansenPartnership.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 15:37:14 -0500
In-Reply-To: <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I also think there's a typo in 8.1: in the first table RCX appears
twice even though the text beneath implies that the second RCX should
actually be RDX.

James

