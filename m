Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087A1FDA92
	for <linux-coco@lists.linux.dev>; Mon, 13 Jan 2025 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762502; cv=none; b=s6/bno5WNJ5Jk2+jEB54vyyPS2Nq9MxZuh3OzrwKE7aweDdztq4FoDxV9Hc8+HE5mF4g2r1UpHcnpHHG2StiGEJZO5eNXgnjDTmuuCv2y4Bi/THRgVA3gGbjpYhL8d4dygToX3c4Z2pQ1kim3CGA+jyoYnK+iU3zSorQpREezFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762502; c=relaxed/simple;
	bh=Hdwh/0+v0e0LP2utcgcINCNpZ4cYa7JV5nQ3hjjcb+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY4xMS2bB5SYdCqcDl6rrSt7wLBDBRHjmHbQP11NDJ8DE3JhSAi0knsNxpoHWiJNzoYmIUXMJRzv3BpjD4ZWsJSLEbX9X9caoPHmw6z3TrtnjoOnRbFR9J18rEutixyMSSQ3Wqs8Ic2fRfBy1c6m65E7yMnJQh3Z7DguPv3pWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=KrlnsTkf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MSMEL2d8; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="KrlnsTkf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MSMEL2d8"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C6187114013F;
	Mon, 13 Jan 2025 05:01:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 13 Jan 2025 05:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1736762499; x=
	1736848899; bh=VoG/OMcJ8d12ZSyD0ZqYeoPA89F0kd/HTyrd5huWlHw=; b=K
	rlnsTkf9lv1i8j7tfYuyo5h2c1OL/22qr80W60Nx/KEnCaET0V/u87X76HmZ3GmC
	6v668UAUbRHupPRtl+Ehhj9+kzsJ/Qpm1XphTBFrF93HpDfOaMnD6IPBwjymfzyF
	3QoE4sqi//8Hjpg0/VzwZwtTrB0eVdYiDr9BdPOJlvAjTrT+zCyponn1oXstyI8e
	04YDae0SMxMMa2/6Nnx9eKBCpKvquzrgVLUVWT3/psDNrkmSJXLryCwUzCd8NWxQ
	P1rOt10s+7oMx36yq9lILiQqumvlz0U6bcDkzVORJrUx/E3JIe+KhIkSnizNvYF6
	jMg4+hlIVRTs8MTgPFqUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736762499; x=1736848899; bh=VoG/OMcJ8d12ZSyD0ZqYeoPA89F0kd/HTyr
	d5huWlHw=; b=MSMEL2d8Fyv8uhUhKMeO95+5BddVh6aCKavbuF2wgEl8Lfz+JFu
	8YF7mOnaEnMu/jVDK47ktOr6LPyE7jMjVWzVgjwGwrU/MMjX4SCbB5pRJBajeqsX
	trpAQ2Uqb7zUrhnh6uqExk0L/mfcG7frTY+GhGIjreYWRxtR8BxkHprVGVfiJTtF
	o0trqHgvYQEsWoboOvysLpFf4RhFuK1ZO4M2Jg9Qa7c0sknj57a/jE93TEFufYoh
	dQDlWiwKmRrhZR6b8dJ35HMuVZQiDunJSMn4PWD6DAgBeLPAXh34ynpEYkFC+7e1
	9DAdj4zzMXclu/FT/8XrPfySLsIejwAAaDQ==
X-ME-Sender: <xms:g-SEZ-3mqwfYA3cplCVhLSqkCAqNXG9XCkw69USpRKknmXbBWNIdVQ>
    <xme:g-SEZxFdHGbUcjnDnZl3f3twIY2gAfXZ9W7rP_bkWnJKXmDpLAC7DDiX9V_Qyau4z
    py3WiyGQV5AvLFuIR0>
X-ME-Received: <xmr:g-SEZ24-vXbYbugB8EO3qVlpYpyIyu-cP2W-tlpeyBruGUm6nY5KF2rd2GvkYV-RY3XGDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehgedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvden
    ucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlse
    hshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfhhfff
    veelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhv
    rdhnrghmvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepvggsihgvuggvrhhmseigmhhishhsihhonhdrtghomhdprhgtphhtthhopehkvgig
    vggtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohephigrnhdrhi
    driihhrghosehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghotghose
    hlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprhhitghkrdhprdgvughgvggtohhmsggvsehinhhtvghlrdgtoh
    hmpdhrtghpthhtohepkhhirhhilhhlrdhshhhuthgvmhhovheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:g-SEZ_3U9co5D91RLeJssdWWZ6Q_HF544c7wdJGHwHZdknayq3K3Wg>
    <xmx:g-SEZxHChkORcqEehTUhskOyXcK6WHAtn3feTNA1QdfBJ64NQacSVQ>
    <xmx:g-SEZ4-DTvnroz48NDUjHE_dgHIXIcYnmW1lV7s21CFybjt8rw7RWw>
    <xmx:g-SEZ2kPEm05Bd6223mIrfKdWI1SVm8ZKtR_wnnqX5IhDDK-HOWNDA>
    <xmx:g-SEZwAvzvOekzSCzi9N3L1knINsX6eSFKtw8krgShqv4VUZqUYhXNY3>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 05:01:35 -0500 (EST)
Date: Mon, 13 Jan 2025 12:01:32 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: ebiederm@xmission.com, kexec@lists.infradead.org
Cc: Yan Zhao <yan.y.zhao@intel.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, x86@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, bhe@redhat.com
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination
 addresses
Message-ID: <xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
References: <20241213094930.748-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213094930.748-1-yan.y.zhao@intel.com>

On Fri, Dec 13, 2024 at 05:49:30PM +0800, Yan Zhao wrote:
> Hi Eric,
> 
> This is a repost of the patch "kexec_core: Accept unaccepted kexec
> destination addresses" [1], rebased to v6.13-rc2.

Can we get this patch applied?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
