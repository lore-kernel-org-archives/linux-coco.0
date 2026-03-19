Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7361E3033C2
	for <linux-coco@lists.linux.dev>; Thu, 19 Mar 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929201; cv=none; b=tMTTAipwVKDRInlEmCaSpc7sMzacpON9lrm63XJPtsCz9QSrbyX2JlioIahY4yTyYK9bSOfiTmEepPeeF9h7ROeN2kNiWnXlVLgrjZzBb1hmLrmTWPYZccSuZs7WQO0oWAeRFwPpCu842Tg7t/PTY0yJQaJLRqLtdqH1mgS/5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929201; c=relaxed/simple;
	bh=LeYbxgchomL/v7yBIeu+qbW+oFzjbgmbldcN8JSrBR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxqfEmcwfT0WiORxdLiAY386VUoRX0ezMNbSFMPTs72bpa1dmAzfCsridhpjUVBzy0cJaB1vYjghwHKVINrK5ETYxMDSagMHJRRMctBnx79YSdb0ivpVXSG76zJ+v1Qr+bcM4KrHT3DrSHlNgcFt9N7y94LL5rVGsKmSQdw/g30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T20RuryK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T20RuryK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2B9C2BCAF;
	Thu, 19 Mar 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929201;
	bh=LeYbxgchomL/v7yBIeu+qbW+oFzjbgmbldcN8JSrBR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T20RuryKyed56KTMhMWQSe7tg4BgurYldQX0/zM8bXiiMhU7jK6X4VDr58QBe5Itt
	 /TCW3JZErrCfBaTIfNPFFvSmvBW56TJgrhnyJ35/rtrQwc0frR/draCxyL9LkYVTe9
	 7+r1Q786TZf8re1S/NMKBf3s1UdiRfua6p3cehiSXCIN03npot/v+lEKRrmH6dNvfL
	 e2dfg9NG3Vpkehan275Y/jCn8Fy0V88A17NVaxoeLmOuvT8yn0iH+XbTUaUP4HMrLk
	 Cn09oKrT91YgaY1hrFBKlSWK3WNimeQ4NdHgm/QH1KNL5BkItrDRm30vsM1NnXMhk8
	 ohmZX2hkluNaw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BD79F40068;
	Thu, 19 Mar 2026 10:06:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 19 Mar 2026 10:06:38 -0400
X-ME-Sender: <xms:7gK8af4MDWcLo8JikzhPox3DlB9mp4NsOAeaUAMVKC7Ms6ty0Rr43A>
    <xme:7gK8aVnIqr24v3vzQ_velQUzPxU9PIlz6Vj0lbIuk5pNhRk6Jsbl4lGU-ZERoF-Iw
    qZs9aZc3SMFWrG3t1SiZJEIa3uzwV7mgsw9ZyXz0wIlXHs8frAbJNU>
X-ME-Received: <xmr:7gK8aRirukAw3f6Am80Om4XAkazTjRbYtasALG-iEWjAsFDZRzzL3mGt5uXziw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegthhgrohdrghgrohesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgtohgtoheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehkvhhmsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghinhgsihhnrdifuheslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopegurghnrdhjrdifihhllhhirghmshesih
    hnthgvlhdrtghomhdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
    dprhgtphhtthhopehkrghirdhhuhgrnhhgsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:7gK8aQI7IzLilYxG5x6utTbUsXwlIvXnmSQmVgBdvySu_Dz0S02avw>
    <xmx:7gK8aWF1LjSPLwgI5qrVFXTv80lZo07m1AouRsq1LHHC6woobjLZYQ>
    <xmx:7gK8aaYr7k8ABLGudwLA1_2JcxzRHTut4HCFs3beTK22iCK9epqXYQ>
    <xmx:7gK8aePdwyc-cFxo6hDQ6aRa2_VGBTyt3S9xtHjoBuxfS4MUd5hXCg>
    <xmx:7gK8aTisS_XYuY7idrkQiau7Pczj--G8sn_VNpVjlFB-OWEDSY7FD2hO>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 10:06:37 -0400 (EDT)
Date: Thu, 19 Mar 2026 14:06:36 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, binbin.wu@linux.intel.com, dan.j.williams@intel.com, 
	dave.hansen@linux.intel.com, ira.weiny@intel.com, kai.huang@intel.com, nik.borisov@suse.com, 
	paulmck@kernel.org, pbonzini@redhat.com, reinette.chatre@intel.com, 
	rick.p.edgecombe@intel.com, sagis@google.com, seanjc@google.com, 
	tony.lindgren@linux.intel.com, vannapurve@google.com, vishal.l.verma@intel.com, 
	yilun.xu@linux.intel.com, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 22/22] x86/virt/seamldr: Log TDX module update failures
Message-ID: <abwCz6HsMopm2wFF@thinkstation>
References: <20260315135920.354657-1-chao.gao@intel.com>
 <20260315135920.354657-23-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315135920.354657-23-chao.gao@intel.com>

On Sun, Mar 15, 2026 at 06:58:42AM -0700, Chao Gao wrote:
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index e6b7af410c54..4e1ad06506cc 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -222,6 +222,11 @@ static void ack_state(void)
>  		set_target_state(update_data.state + 1);
>  }
>  
> +static void print_update_failure_message(void)
> +{
> +	pr_err_once("update failed, SEAMCALLs will report failure until TDs killed\n");

Is it useful to indicate which step has failed?

> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
